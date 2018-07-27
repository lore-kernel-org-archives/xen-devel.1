From: "Bercaru, Gabriel" <bercarug@amazon.com>
Subject: Re: PVH dom0 creation fails - the system freezes
Date: Fri, 27 Jul 2018 08:48:32 +0000
Message-ID: <1532681311565.24220@amazon.com>
References: <58fc47aa-0c76-4083-b605-b23353d5e42a@amazon.com>
 <5B56F77202000078001D717D@prv1-mh.provo.novell.com>
 <88eaaa06-24c9-d474-c40a-f37bafe1ad67@amazon.com>
 <20180725133530.235csakkjrz6y5yr@mac.bytemobile.com>
 <40a982ee-06c4-e45a-006e-f75df79eb14b@amazon.com>
 <20180725141204.j2pzznmaeuwis32q@mac.bytemobile.com>
 <39fd8a224e5e4a39999b04582d45a0c4@AMSPEX02CL03.citrite.net>,
 <20180726164611.gneruvoi5vmvbkd5@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="_002_153268131156524220amazoncom_"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tktb=kl=amazon.com=prvs=739d10b25=bercarug@srs-us1.protection.inumbo.net>)
 id 1fiySg-0005cL-Gk
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 08:50:58 +0000
In-Reply-To: <20180726164611.gneruvoi5vmvbkd5@mac.bytemobile.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, David Woodhouse <dwmw2@infradead.org>, Jan Beulich <JBeulich@suse.com>, "Belgun, Adrian" <abelgun@amazon.com>
List-Id: xen-devel@lists.xenproject.org

--_002_153268131156524220amazoncom_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I tried the patch and it fixes the unusable USB devices problem.
However, I captured the boot messages and the "IOMMU mapping failed" printk
seems to have been executed on each iteration of the loop.

I attached a small section of the boot log. As I said, the warning log was =
displayed
many more times, I removed a lot of them to keep the attached file short.

Gabriel
________________________________________
From: Roger Pau Monn=E9 <roger.pau@citrix.com>
Sent: Thursday, July 26, 2018 7:46 PM
To: Paul Durrant
Cc: Bercaru, Gabriel; xen-devel; David Woodhouse; Jan Beulich; Belgun, Adri=
an
Subject: Re: [Xen-devel] PVH dom0 creation fails - the system freezes

On Wed, Jul 25, 2018 at 05:19:03PM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Xen-devel [mailto:xen-devel-bounces@lists.xenproject.org] On Beha=
lf
> > Of Roger Pau Monn=E9
> > Sent: 25 July 2018 15:12
> > To: bercarug@amazon.com
> > Cc: xen-devel <xen-devel@lists.xenproject.org>; David Woodhouse
> > <dwmw2@infradead.org>; Jan Beulich <JBeulich@suse.com>;
> > abelgun@amazon.com
> > Subject: Re: [Xen-devel] PVH dom0 creation fails - the system freezes
> >
> > On Wed, Jul 25, 2018 at 04:57:23PM +0300, bercarug@amazon.com wrote:
> > > On 07/25/2018 04:35 PM, Roger Pau Monn=E9 wrote:
> > > > On Wed, Jul 25, 2018 at 01:06:43PM +0300, bercarug@amazon.com
> > wrote:
> > > > > On 07/24/2018 12:54 PM, Jan Beulich wrote:
> > > > > > > > > On 23.07.18 at 13:50, <bercarug@amazon.com> wrote:
> > > > > > > For the last few days, I have been trying to get a PVH dom0 r=
unning,
> > > > > > > however I encountered the following problem: the system seems
> > to
> > > > > > > freeze after the hypervisor boots, the screen goes black. I h=
ave
> > tried to
> > > > > > > debug it via a serial console (using Minicom) and managed to =
get
> > some
> > > > > > > more Xen output, after the screen turns black.
> > > > > > >
> > > > > > > I mention that I have tried to boot the PVH dom0 using differ=
ent
> > kernel
> > > > > > > images (from 4.9.0 to 4.18-rc3), different Xen  versions (4.1=
0, 4.11,
> > 4.12).
> > > > > > >
> > > > > > > Below I attached my system / hypervisor configuration, as wel=
l as
> > the
> > > > > > > output captured through the serial console, corresponding to =
the
> > latest
> > > > > > > versions for Xen and the Linux Kernel (Xen staging and Kernel=
 from
> > the
> > > > > > > xen/tip tree).
> > > > > > > [...]
> > > > > > > (XEN) [VT-D]iommu.c:919: iommu_fault_status: Fault Overflow
> > > > > > > (XEN) [VT-D]iommu.c:921: iommu_fault_status: Primary Pending
> > Fault
> > > > > > > (XEN) [VT-D]DMAR:[DMA Write] Request device [0000:00:14.0] fa=
ult
> > addr 8deb3000, iommu reg =3D ffff82c00021b000
> > > > Can you figure out which PCI device is 00:14.0?
> > > This is the output of lspci -vvv for device 00:14.0:
> > >
> > > 00:14.0 USB controller: Intel Corporation Sunrise Point-H USB 3.0 xHCI
> > > Controller (rev 31) (prog-if 30 [XHCI])
> > >         Subsystem: Intel Corporation Sunrise Point-H USB 3.0 xHCI Con=
troller
> > >         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> > ParErr+
> > > Stepping- SERR+ FastB2B- DisINTx+
> > >         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TA=
bort-
> > > <TAbort- <MAbort+ >SERR- <PERR- INTx-
> > >         Latency: 0
> > >         Interrupt: pin A routed to IRQ 178
> > >         Region 0: Memory at a2e00000 (64-bit, non-prefetchable) [size=
=3D64K]
> > >         Capabilities: [70] Power Management version 2
> > >                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D375mA
> > > PME(D0-,D1-,D2-,D3hot+,D3cold+)
> > >                 Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0=
 PME-
> > >         Capabilities: [80] MSI: Enable+ Count=3D1/8 Maskable- 64bit+
> > >                 Address: 00000000fee0e000  Data: 4021
> > >         Kernel driver in use: xhci_hcd
> > >         Kernel modules: xhci_pci
> >
> > I'm afraid your USB controller is missing RMRR entries in the DMAR
> > ACPI tables, thus causing the IOMMU faults and not working properly.
> >
> > You could try to manually add some extra rmrr regions by appending:
> >
> > rmrr=3D0x8deb3=3D0:0:14.0
> >
> > To the Xen command line, and keep adding any address that pops up in
> > the iommu faults. This is of course quite cumbersome, but there's no
> > way to get the required memory addresses if the data in RMRR is
> > wrong/incomplete.
> >
>
> You could just add all E820 reserved regions in there. That will almost c=
ertainly cover it.

I have a prototype patch for this that attempts to identity map all
reserved regions below 4GB to the p2m. It's still a WIP, but if you
could give it a try that would help me figure out whether this fixes
your issues and is indeed something that would be good to have.

I don't really like the patch as-is because it doesn't check whether
the reserved regions added to the p2m overlap with the LAPIC page or
the PCIe MCFG regions for example, I will continue to work on a safer
version.

If you can give this a shot, please remove any rmrr options from the
command line and use iommu=3Ddebug in order to catch any issues.

Thanks, Roger.
---8<---
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iomm=
u.c
index 2c44fabf99..76a1fd6681 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -21,6 +21,8 @@
 #include <xen/keyhandler.h>
 #include <xsm/xsm.h>

+#include <asm/setup.h>
+
 static int parse_iommu_param(const char *s);
 static void iommu_dump_p2m_table(unsigned char key);

@@ -47,6 +49,8 @@ integer_param("iommu_dev_iotlb_timeout", iommu_dev_iotlb_=
timeout);
  *   no-igfx                    Disable VT-d for IGD devices (insecure)
  *   no-amd-iommu-perdev-intremap Don't use per-device interrupt remapping
  *                              tables (insecure)
+ *   inclusive                  Include any memory ranges below 4GB not us=
ed
+ *                              by Xen or unusable to the iommu page table=
s.
  */
 custom_param("iommu", parse_iommu_param);
 bool_t __initdata iommu_enable =3D 1;
@@ -60,6 +64,7 @@ bool_t __read_mostly iommu_passthrough;
 bool_t __read_mostly iommu_snoop =3D 1;
 bool_t __read_mostly iommu_qinval =3D 1;
 bool_t __read_mostly iommu_intremap =3D 1;
+bool __read_mostly iommu_inclusive =3D true;

 /*
  * In the current implementation of VT-d posted interrupts, in some extreme
@@ -126,6 +131,8 @@ static int __init parse_iommu_param(const char *s)
             iommu_dom0_strict =3D val;
         else if ( !strncmp(s, "sharept", ss - s) )
             iommu_hap_pt_share =3D val;
+        else if ( !strncmp(s, "inclusive", ss - s) )
+            iommu_inclusive =3D val;
         else
             rc =3D -EINVAL;

@@ -165,6 +172,85 @@ static void __hwdom_init check_hwdom_reqs(struct domai=
n *d)
     iommu_dom0_strict =3D 1;
 }

+static void __hwdom_init setup_inclusive_mappings(struct domain *d)
+{
+    unsigned long i, j, tmp, top, max_pfn;
+
+    BUG_ON(!is_hardware_domain(d));
+
+    max_pfn =3D (GB(4) >> PAGE_SHIFT) - 1;
+    top =3D max(max_pdx, pfn_to_pdx(max_pfn) + 1);
+
+    for ( i =3D 0; i < top; i++ )
+    {
+        unsigned long pfn =3D pdx_to_pfn(i);
+        bool map;
+        int rc =3D 0;
+
+        /*
+         * Set up 1:1 mapping for dom0. Default to include only
+         * conventional RAM areas and let RMRRs include needed reserved
+         * regions. When set, the inclusive mapping additionally maps in
+         * every pfn up to 4GB except those that fall in unusable ranges.
+         */
+        if ( pfn > max_pfn && !mfn_valid(_mfn(pfn)) )
+            continue;
+
+        if ( is_pv_domain(d) && iommu_inclusive && pfn <=3D max_pfn )
+            map =3D !page_is_ram_type(pfn, RAM_TYPE_UNUSABLE);
+        else if ( is_hvm_domain(d) && iommu_inclusive )
+            map =3D page_is_ram_type(pfn, RAM_TYPE_RESERVED);
+        else
+            map =3D page_is_ram_type(pfn, RAM_TYPE_CONVENTIONAL);
+
+        if ( !map )
+            continue;
+
+        /* Exclude Xen bits */
+        if ( xen_in_range(pfn) )
+            continue;
+
+        /*
+         * If dom0-strict mode is enabled or guest type is HVM/PVH then ex=
clude
+         * conventional RAM and let the common code map dom0's pages.
+         */
+        if ( (iommu_dom0_strict || is_hvm_domain(d)) &&
+             page_is_ram_type(pfn, RAM_TYPE_CONVENTIONAL) )
+            continue;
+
+        /* For HVM avoid memory below 1MB because that's already mapped. */
+        if ( is_hvm_domain(d) && pfn < PFN_DOWN(MB(1)) )
+            continue;
+
+        tmp =3D 1 << (PAGE_SHIFT - PAGE_SHIFT_4K);
+        for ( j =3D 0; j < tmp; j++ )
+        {
+            int ret;
+
+            if ( iommu_use_hap_pt(d) )
+            {
+                ASSERT(is_hvm_domain(d));
+                ret =3D set_identity_p2m_entry(d, pfn * tmp + j, p2m_acces=
s_rw,
+                                             0);
+            }
+            else
+                ret =3D iommu_map_page(d, pfn * tmp + j, pfn * tmp + j,
+                                     IOMMUF_readable|IOMMUF_writable);
+
+            if ( !rc )
+               rc =3D ret;
+        }
+
+        if ( rc )
+            printk(XENLOG_WARNING " d%d: IOMMU mapping failed: %d\n",
+                   d->domain_id, rc);
+
+        if (!(i & (0xfffff >> (PAGE_SHIFT - PAGE_SHIFT_4K))))
+            process_pending_softirqs();
+    }
+
+}
+
 void __hwdom_init iommu_hwdom_init(struct domain *d)
 {
     const struct domain_iommu *hd =3D dom_iommu(d);
@@ -207,7 +293,10 @@ void __hwdom_init iommu_hwdom_init(struct domain *d)
                    d->domain_id, rc);
     }

-    return hd->platform_ops->hwdom_init(d);
+    hd->platform_ops->hwdom_init(d);
+
+    if ( !iommu_passthrough )
+        setup_inclusive_mappings(d);
 }

 void iommu_teardown(struct domain *d)
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough=
/vtd/extern.h
index fb7edfaef9..91cadc602e 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -99,6 +99,4 @@ void pci_vtd_quirk(const struct pci_dev *);
 bool_t platform_supports_intremap(void);
 bool_t platform_supports_x2apic(void);

-void vtd_set_hwdom_mapping(struct domain *d);
-
 #endif // _VTD_EXTERN_H_
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/=
vtd/iommu.c
index 1710256823..569ec4aec2 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1304,12 +1304,6 @@ static void __hwdom_init intel_iommu_hwdom_init(stru=
ct domain *d)
 {
     struct acpi_drhd_unit *drhd;

-    if ( !iommu_passthrough && is_pv_domain(d) )
-    {
-        /* Set up 1:1 page table for hardware domain. */
-        vtd_set_hwdom_mapping(d);
-    }
-
     setup_hwdom_pci_devices(d, setup_hwdom_device);
     setup_hwdom_rmrr(d);

diff --git a/xen/drivers/passthrough/vtd/x86/vtd.c b/xen/drivers/passthroug=
h/vtd/x86/vtd.c
index cc2bfea162..9971915349 100644
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ b/xen/drivers/passthrough/vtd/x86/vtd.c
@@ -32,11 +32,9 @@
 #include "../extern.h"

 /*
- * iommu_inclusive_mapping: when set, all memory below 4GB is included in =
dom0
- * 1:1 iommu mappings except xen and unusable regions.
+ * iommu_inclusive_mapping: superseded by iommu=3Dinclusive.
  */
-static bool_t __hwdom_initdata iommu_inclusive_mapping =3D 1;
-boolean_param("iommu_inclusive_mapping", iommu_inclusive_mapping);
+boolean_param("iommu_inclusive_mapping", iommu_inclusive);

 void *map_vtd_domain_page(u64 maddr)
 {
@@ -107,67 +105,3 @@ void hvm_dpci_isairq_eoi(struct domain *d, unsigned in=
t isairq)
     }
     spin_unlock(&d->event_lock);
 }
-
-void __hwdom_init vtd_set_hwdom_mapping(struct domain *d)
-{
-    unsigned long i, j, tmp, top, max_pfn;
-
-    BUG_ON(!is_hardware_domain(d));
-
-    max_pfn =3D (GB(4) >> PAGE_SHIFT) - 1;
-    top =3D max(max_pdx, pfn_to_pdx(max_pfn) + 1);
-
-    for ( i =3D 0; i < top; i++ )
-    {
-        unsigned long pfn =3D pdx_to_pfn(i);
-        bool map;
-        int rc =3D 0;
-
-        /*
-         * Set up 1:1 mapping for dom0. Default to include only
-         * conventional RAM areas and let RMRRs include needed reserved
-         * regions. When set, the inclusive mapping additionally maps in
-         * every pfn up to 4GB except those that fall in unusable ranges.
-         */
-        if ( pfn > max_pfn && !mfn_valid(_mfn(pfn)) )
-            continue;
-
-        if ( iommu_inclusive_mapping && pfn <=3D max_pfn )
-            map =3D !page_is_ram_type(pfn, RAM_TYPE_UNUSABLE);
-        else
-            map =3D page_is_ram_type(pfn, RAM_TYPE_CONVENTIONAL);
-
-        if ( !map )
-            continue;
-
-        /* Exclude Xen bits */
-        if ( xen_in_range(pfn) )
-            continue;
-
-        /*
-         * If dom0-strict mode is enabled then exclude conventional RAM
-         * and let the common code map dom0's pages.
-         */
-        if ( iommu_dom0_strict &&
-             page_is_ram_type(pfn, RAM_TYPE_CONVENTIONAL) )
-            continue;
-
-        tmp =3D 1 << (PAGE_SHIFT - PAGE_SHIFT_4K);
-        for ( j =3D 0; j < tmp; j++ )
-        {
-            int ret =3D iommu_map_page(d, pfn * tmp + j, pfn * tmp + j,
-                                     IOMMUF_readable|IOMMUF_writable);
-
-            if ( !rc )
-               rc =3D ret;
-        }
-
-        if ( rc )
-            printk(XENLOG_WARNING VTDPREFIX " d%d: IOMMU mapping failed: %=
d\n",
-                   d->domain_id, rc);
-
-        if (!(i & (0xfffff >> (PAGE_SHIFT - PAGE_SHIFT_4K))))
-            process_pending_softirqs();
-    }
-}
-
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 6b42e3b876..15d6584837 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -35,6 +35,7 @@ extern bool_t iommu_snoop, iommu_qinval, iommu_intremap, =
iommu_intpost;
 extern bool_t iommu_hap_pt_share;
 extern bool_t iommu_debug;
 extern bool_t amd_iommu_perdev_intremap;
+extern bool iommu_inclusive;

 extern unsigned int iommu_dev_iotlb_timeout;






Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.

--_002_153268131156524220amazoncom_
Content-Type: text/plain; name="iommu.txt"
Content-Description: iommu.txt
Content-Disposition: attachment; filename="iommu.txt"; size=1732;
	creation-date="Fri, 27 Jul 2018 08:45:22 GMT";
	modification-date="Fri, 27 Jul 2018 08:45:22 GMT"
Content-Transfer-Encoding: base64

KFhFTikgKioqIEJ1aWxkaW5nIGEgUFZIIERvbTAgKioqCihYRU4pIFtWVC1EXWQwOkhvc3Ricmlk
Z2U6IHNraXAgMDAwMDowMDowMC4wIG1hcAooWEVOKSBbVlQtRF1kMDpQQ0k6IG1hcCAwMDAwOjAw
OjE0LjAKKFhFTikgW1ZULURdZDA6UENJOiBtYXAgMDAwMDowMDoxNC4yCihYRU4pIFtWVC1EXWQw
OlBDSTogbWFwIDAwMDA6MDA6MTYuMAooWEVOKSBbVlQtRF1kMDpQQ0k6IG1hcCAwMDAwOjAwOjE2
LjEKKFhFTikgW1ZULURdZDA6UENJOiBtYXAgMDAwMDowMDoxNy4wCihYRU4pIFtWVC1EXWQwOlBD
STogbWFwIDAwMDA6MDA6MWYuMAooWEVOKSBbVlQtRF1kMDpQQ0k6IG1hcCAwMDAwOjAwOjFmLjIK
KFhFTikgW1ZULURdZDA6UENJOiBtYXAgMDAwMDowMDoxZi40CihYRU4pIFtWVC1EXWQwOlBDSWU6
IG1hcCAwMDAwOjAxOjAwLjAKKFhFTikgW1ZULURdZDA6UENJZTogbWFwIDAwMDA6MDI6MDAuMAoo
WEVOKSBbVlQtRF1kMDpQQ0llOiBtYXAgMDAwMDowMzowMC4wCihYRU4pIFtWVC1EXWQwOlBDSWU6
IG1hcCAwMDAwOjA0OjAwLjAKKFhFTikgW1ZULURdaW9tbXVfZW5hYmxlX3RyYW5zbGF0aW9uOiBp
b21tdS0+cmVnID0gZmZmZjgyYzAwMDIxYjAwMAooWEVOKSBoYXAuYzoyODk6IGQwIGZhaWxlZCB0
byBhbGxvY2F0ZSBmcm9tIEhBUCBwb29sCihYRU4pICBkMDogSU9NTVUgbWFwcGluZyBmYWlsZWQ6
IC0yCihYRU4pICBkMDogSU9NTVUgbWFwcGluZyBmYWlsZWQ6IC0yCihYRU4pICBkMDogSU9NTVUg
bWFwcGluZyBmYWlsZWQ6IC0yCihYRU4pICBkMDogSU9NTVUgbWFwcGluZyBmYWlsZWQ6IC0yCihY
RU4pICBkMDogSU9NTVUgbWFwcGluZyBmYWlsZWQ6IC0yCihYRU4pICBkMDogSU9NTVUgbWFwcGlu
ZyBmYWlsZWQ6IC0yCihYRU4pICBkMDogSU9NTVUgbWFwcGluZyBmYWlsZWQ6IC0yCihYRU4pICBk
MDogSU9NTVUgbWFwcGluZyBmYWlsZWQ6IC0yCihYRU4pICBkMDogSU9NTVUgbWFwcGluZyBmYWls
ZWQ6IC0yCihYRU4pICBkMDogSU9NTVUgbWFwcGluZyBmYWlsZWQ6IC0yCihYRU4pIENhbm5vdCBz
ZXR1cCBpZGVudGl0eSBtYXAgZDA6ZmVlMDAsIGdmbiBhbHJlYWR5IG1hcHBlZCB0byAxMDIxYzYz
LgooWEVOKSAgZDA6IElPTU1VIG1hcHBpbmcgZmFpbGVkOiAtMTYKKFhFTikgIGQwOiBJT01NVSBt
YXBwaW5nIGZhaWxlZDogLTIKKFhFTikgIGQwOiBJT01NVSBtYXBwaW5nIGZhaWxlZDogLTIKKFhF
TikgIGQwOiBJT01NVSBtYXBwaW5nIGZhaWxlZDogLTIKKFhFTikgIGQwOiBJT01NVSBtYXBwaW5n
IGZhaWxlZDogLTIKKFhFTikgIGQwOiBJT01NVSBtYXBwaW5nIGZhaWxlZDogLTIKKFhFTikgIGQw
OiBJT01NVSBtYXBwaW5nIGZhaWxlZDogLTIKKFhFTikgIGQwOiBJT01NVSBtYXBwaW5nIGZhaWxl
ZDogLTIKKFhFTikgIGQwOiBJT01NVSBtYXBwaW5nIGZhaWxlZDogLTIKKFhFTikgIGQwOiBJT01N
VSBtYXBwaW5nIGZhaWxlZDogLTIKKFhFTikgIGQwOiBJT01NVSBtYXBwaW5nIGZhaWxlZDogLTIK
KFhFTikgIGQwOiBJT01NVSBtYXBwaW5nIGZhaWxlZDogLTIKKFhFTikgIGQwOiBJT01NVSBtYXBw
aW5nIGZhaWxlZDogLTIKKFhFTikgIGQwOiBJT01NVSBtYXBwaW5nIGZhaWxlZDogLTIKKFhFTikg
IGQwOiBJT01NVSBtYXBwaW5nIGZhaWxlZDogLTIKKFhFTikgIGQwOiBJT01NVSBtYXBwaW5nIGZh
aWxlZDogLTIKKFhFTikgV0FSTklORzogUFZIIGlzIGFuIGV4cGVyaW1lbnRhbCBtb2RlIHdpdGgg
bGltaXRlZCBmdW5jdGlvbmFsaXR5Cg==

--_002_153268131156524220amazoncom_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--_002_153268131156524220amazoncom_--
