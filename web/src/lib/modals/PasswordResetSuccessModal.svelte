<script lang="ts">
  import { copyToClipboard } from '$lib/utils';
  import { Button, Code, HStack, IconButton, Modal, ModalBody, ModalFooter, Text } from '@immich/ui';
  import { mdiCheck, mdiContentCopy } from '@mdi/js';
  import { t } from 'svelte-i18n';

  type Props = {
    onClose: () => void;
    newPassword: string;
  };

  const { onClose, newPassword }: Props = $props();
</script>

<Modal title={$t('password_reset_success')} icon={mdiCheck} onClose={() => onClose()} size="small">
  <ModalBody>
    <div class="flex flex-col gap-4">
      <Text>{$t('admin.user_password_has_been_reset')}</Text>

      <div class="flex justify-center gap-2 items-center">
        <Code color="primary">{newPassword}</Code>
        <IconButton
          icon={mdiContentCopy}
          shape="round"
          color="secondary"
          variant="ghost"
          onclick={() => copyToClipboard(newPassword)}
          title={$t('copy_password')}
          aria-label={$t('copy_password')}
        />
      </div>

      <Text>{$t('admin.user_password_reset_description')}</Text>
    </div>
  </ModalBody>

  <ModalFooter>
    <HStack fullWidth>
      <Button shape="round" color="primary" fullWidth onclick={() => onClose()}>
        {$t('done')}
      </Button>
    </HStack>
  </ModalFooter>
</Modal>
