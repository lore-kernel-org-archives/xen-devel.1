From: Olaf Hering <olaf@aepfle.de>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Wed, 16 May 2018 15:13:48 +0200
Message-ID: <20180516151348.5ebe25e5.olaf@aepfle.de>
References: <20180507151940.GA31926@aepfle.de>
 <20180508133143.77e209f2.olaf@aepfle.de>
 <20180508184026.4f0af76a.olaf@aepfle.de>
 <20180509142316.66171ffd.olaf@aepfle.de>
 <alpine.DEB.2.10.1805091405040.9199@sstabellini-ThinkPad-X260>
 <20180509231336.7f962d11.olaf@aepfle.de>
 <alpine.DEB.2.10.1805091416310.9199@sstabellini-ThinkPad-X260>
 <20180510080411.1c7845b5.olaf@aepfle.de>
 <alpine.DEB.2.10.1805100901170.9199@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6183096409926430602=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1805100901170.9199@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>
Cc: jgross@suse.com, boris.ostrovsky@oracle.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============6183096409926430602==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_//22wwpoZ3_fcOETKZ47Bl1u"; protocol="application/pgp-signature"

--Sig_//22wwpoZ3_fcOETKZ47Bl1u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 10 May 2018 09:03:30 -0700 (PDT)
schrieb Stefano Stabellini <sstabellini@kernel.org>:

> You could add a property to vmstate_xen_platform of xen_platform.c, but
> you need to pay attention to legacy compatibility. Inevitably, there
> will be older versions that do not have the new vmstate_xen_platform
> field or do not set it properly.

Doing the unplug on the other side works if it is done from blk_connect.
At the point xen_platform_post_load is called, qemu is still in the middle =
of=20
initializing. Doing it from there causes weird failures.

Any idea what the proper place is to call platform_do_unplug?

Olaf

--- a/hw/block/xen_disk.c
+++ b/hw/block/xen_disk.c
@@ -31,6 +31,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
+#include "qemu/error-report.h"
=20
 /* ------------------------------------------------------------- */
=20
@@ -1074,6 +1075,9 @@ static int blk_connect(struct XenDevice
     unsigned int i;
     uint32_t *domids;
=20
+    error_report("%s", __func__);
+    xen_unplug_after_migration();
+
     /* read-only ? */
     if (blkdev->directiosafe) {
         qflags =3D BDRV_O_NOCACHE | BDRV_O_NATIVE_AIO;
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -62,6 +62,7 @@ typedef struct PCIXenPlatformState {
     uint8_t flags; /* used only for version_id =3D=3D 2 */
     int drivers_blacklisted;
     uint16_t driver_product_version;
+    uint32_t unplug_val;
=20
     /* Log from guest drivers */
     char log_buffer[4096];
@@ -132,8 +133,13 @@ static void del_nic_peer(NICState *nic,
         qemu_del_net_client(nc->peer);
 }
=20
+static bool pci_unplug_nics_done;
 static void pci_unplug_nics(PCIBus *bus)
 {
+    error_report("%s", __func__);
+    if (pci_unplug_nics_done)
+        return;
+    pci_unplug_nics_done =3D true;
     qemu_foreach_nic(del_nic_peer, NULL);
     pci_for_each_device(bus, 0, unplug_nic, NULL);
 }
@@ -170,30 +176,43 @@ static void unplug_disks(PCIBus *b, PCID
     }
 }
=20
+static bool pci_unplug_disks_done;
 static void pci_unplug_disks(PCIBus *bus, uint32_t flags)
 {
+    error_report("%s", __func__);
+    if (pci_unplug_disks_done)
+        return;
+    pci_unplug_disks_done =3D true;
     pci_for_each_device(bus, 0, unplug_disks, &flags);
 }
=20
+static void platform_do_unplug(PCIXenPlatformState *s, uint32_t val)
+{
+    PCIDevice *pci_dev =3D PCI_DEVICE(s);
+
+    error_report("%s %x", __func__, val);
+    /* Unplug devices. See comment above flag definitions */
+    if (val & (UNPLUG_IDE_SCSI_DISKS | UNPLUG_AUX_IDE_DISKS |
+               UNPLUG_NVME_DISKS)) {
+        DPRINTF("unplug disks\n");
+        pci_unplug_disks(pci_dev->bus, val);
+    }
+    if (val & UNPLUG_ALL_NICS) {
+        DPRINTF("unplug nics\n");
+        pci_unplug_nics(pci_dev->bus);
+    }
+}
+
 static void platform_fixed_ioport_writew(void *opaque, uint32_t addr, uint=
32_t val)
 {
     PCIXenPlatformState *s =3D opaque;
=20
+    error_report("%s %x %x", __func__, addr, val);
     switch (addr) {
-    case 0: {
-        PCIDevice *pci_dev =3D PCI_DEVICE(s);
-        /* Unplug devices. See comment above flag definitions */
-        if (val & (UNPLUG_IDE_SCSI_DISKS | UNPLUG_AUX_IDE_DISKS |
-                   UNPLUG_NVME_DISKS)) {
-            DPRINTF("unplug disks\n");
-            pci_unplug_disks(pci_dev->bus, val);
-        }
-        if (val & UNPLUG_ALL_NICS) {
-            DPRINTF("unplug nics\n");
-            pci_unplug_nics(pci_dev->bus);
-        }
+    case 0:
+        s->unplug_val |=3D val;
+        platform_do_unplug(s, val);
         break;
-    }
     case 2:
         switch (val) {
         case 1:
@@ -332,8 +351,20 @@ static const MemoryRegionOps platform_fi
     .endianness =3D DEVICE_LITTLE_ENDIAN,
 };
=20
+static void *PCIXenPlatformState_for_unplug_after_migration;
+void xen_unplug_after_migration(void)
+{
+    PCIXenPlatformState *s =3D PCIXenPlatformState_for_unplug_after_migrat=
ion;
+    error_report("%s", __func__);
+    if (s)
+        platform_do_unplug(s, s->unplug_val);
+    PCIXenPlatformState_for_unplug_after_migration =3D NULL;
+}
+
 static void platform_fixed_ioport_init(PCIXenPlatformState* s)
 {
+    error_report("%s", __func__);
+    PCIXenPlatformState_for_unplug_after_migration =3D s;
     memory_region_init_io(&s->fixed_io, OBJECT(s), &platform_fixed_io_ops,=
 s,
                           "xen-fixed", 16);
     memory_region_add_subregion(get_system_io(), XEN_PLATFORM_IOPORT,
@@ -356,7 +387,7 @@ static void xen_platform_ioport_writeb(v
                                        uint64_t val, unsigned int size)
 {
     PCIXenPlatformState *s =3D opaque;
-    PCIDevice *pci_dev =3D PCI_DEVICE(s);
+    uint32_t unplug_val =3D 0;
=20
     switch (addr) {
     case 0: /* Platform flags */
@@ -372,17 +403,16 @@ static void xen_platform_ioport_writeb(v
              * If VMDP was to control both disk and LAN it would use 4.
              * If it controlled just disk or just LAN, it would use 8 belo=
w.
              */
-            pci_unplug_disks(pci_dev->bus, UNPLUG_IDE_SCSI_DISKS);
-            pci_unplug_nics(pci_dev->bus);
+            unplug_val |=3D UNPLUG_IDE_SCSI_DISKS | UNPLUG_ALL_NICS;
         }
         break;
     case 8:
         switch (val) {
         case 1:
-            pci_unplug_disks(pci_dev->bus, UNPLUG_IDE_SCSI_DISKS);
+            unplug_val |=3D UNPLUG_IDE_SCSI_DISKS;
             break;
         case 2:
-            pci_unplug_nics(pci_dev->bus);
+            unplug_val |=3D UNPLUG_ALL_NICS;
             break;
         default:
             log_writeb(s, (uint32_t)val);
@@ -392,6 +422,10 @@ static void xen_platform_ioport_writeb(v
     default:
         break;
     }
+    if (unplug_val) {
+        s->unplug_val |=3D unplug_val;
+        platform_do_unplug(s, unplug_val);
+    }
 }
=20
 static const MemoryRegionOps xen_pci_io_ops =3D {
@@ -440,19 +474,23 @@ static int xen_platform_post_load(void *
 {
     PCIXenPlatformState *s =3D opaque;
=20
+    error_report("%s %x", __func__, version_id);
     platform_fixed_ioport_writeb(s, 0, s->flags);
+    if (0)
+    platform_do_unplug(s, s->unplug_val);
=20
     return 0;
 }
=20
 static const VMStateDescription vmstate_xen_platform =3D {
     .name =3D "platform",
-    .version_id =3D 4,
+    .version_id =3D 5,
     .minimum_version_id =3D 4,
     .post_load =3D xen_platform_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_PCI_DEVICE(parent_obj, PCIXenPlatformState),
         VMSTATE_UINT8(flags, PCIXenPlatformState),
+        VMSTATE_UINT32(unplug_val, PCIXenPlatformState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -468,6 +506,8 @@ static void xen_platform_realize(PCIDevi
         return;
     }
=20
+    error_report("%s", __func__);
+
     pci_conf =3D dev->config;
=20
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMO=
RY);
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -29,6 +29,7 @@
=20
 #include "migration/qjson.h"
=20
+extern void xen_unplug_after_migration(void);
 typedef struct VMStateInfo VMStateInfo;
 typedef struct VMStateDescription VMStateDescription;
 typedef struct VMStateField VMStateField;
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2265,6 +2265,7 @@ void qmp_xen_save_devices_state(const ch
     int saved_vm_running;
     int ret;
=20
+    error_report("%s %s %x %x", __func__, filename, has_live, live);
     if (!has_live) {
         /* live default to true so old version of Xen tool stack can have a
          * successfull live migration */
@@ -2284,6 +2285,7 @@ void qmp_xen_save_devices_state(const ch
     object_unref(OBJECT(ioc));
     ret =3D qemu_save_device_state(f);
     qemu_fclose(f);
+    error_report("%s %x", __func__, ret);
     if (ret < 0) {
         error_setg(errp, QERR_IO_ERROR);
     } else {
@@ -2293,6 +2295,7 @@ void qmp_xen_save_devices_state(const ch
          * So call bdrv_inactivate_all (release locks) here to let the oth=
er
          * side of the migration take controle of the images.
          */
+        error_report("%s %x saved_vm_running %x", __func__, live, saved_vm=
_running);
         if (live && !saved_vm_running) {
             ret =3D bdrv_inactivate_all();
             if (ret) {
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1240,6 +1240,7 @@ void xen_hvm_init(PCMachineState *pcms,
     evtchn_port_t bufioreq_evtchn;
     XenIOState *state;
=20
+    error_report("%s", __func__);
     state =3D g_malloc0(sizeof (XenIOState));
=20
     state->xce_handle =3D xenevtchn_open(NULL, 0);
--- a/hw/xen/xen_backend.c
+++ b/hw/xen/xen_backend.c
@@ -588,6 +588,7 @@ int xen_be_register(const char *type, st
=20
 void xen_be_register_common(void)
 {
+    error_report("%s", __func__);
     xen_set_dynamic_sysbus();
=20
     xen_be_register("console", &xen_console_ops);
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -34,6 +34,7 @@ static void xen_init_pv(MachineState *ma
     DriveInfo *dinfo;
     int i;
=20
+    error_report("%s", __func__);
     /* Initialize backend core & drivers */
     if (xen_be_init() !=3D 0) {
         fprintf(stderr, "%s: xen backend core setup failed\n", __FUNCTION_=
_);
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -338,6 +338,7 @@ int qemu_open(const char *name, int flag
         qemu_set_cloexec(ret);
     }
 #endif
+    error_report("%s %d =3D %s", __func__, ret, name);
=20
 #ifdef O_DIRECT
     if (ret =3D=3D -1 && errno =3D=3D EINVAL && (flags & O_DIRECT)) {
@@ -353,6 +354,7 @@ int qemu_close(int fd)
 {
     int64_t fdset_id;
=20
+    error_report("%s %d", __func__, fd);
     /* Close fd that was dup'd from an fdset */
     fdset_id =3D monitor_fdset_dup_fd_find(fd);
     if (fdset_id !=3D -1) {
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -87,6 +87,7 @@ static void pc_init1(MachineState *machi
     MemoryRegion *rom_memory;
     ram_addr_t lowmem;
=20
+    error_report("%s e", __func__);
     /*
      * Calculate ram split, for memory below and above 4G.  It's a bit
      * complicated for backward compatibility reasons ...
@@ -302,6 +303,7 @@ static void pc_init1(MachineState *machi
         nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
                                pcms->fw_cfg, OBJECT(pcms));
     }
+    error_report("%s l", __func__);
 }
=20
 /* Looking for a pc_compat_2_4() function? It doesn't exist.

--Sig_//22wwpoZ3_fcOETKZ47Bl1u
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvwujAAKCRBdQqD6ppg2
fnqrAJ9kGI3SdyM1q1RdKWXOeyTtlw2/wQCeO/zSQ2oJz5Wzunm93uPKA58LZOE=
=wpwi
-----END PGP SIGNATURE-----

--Sig_//22wwpoZ3_fcOETKZ47Bl1u--


--===============6183096409926430602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6183096409926430602==--
