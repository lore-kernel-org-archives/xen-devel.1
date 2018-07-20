From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH V5] x86/altp2m: Fix crash with
 INVALID_ALTP2M EPTP index
Date: Fri, 20 Jul 2018 16:07:11 +0100
Message-ID: <ab532b31-0eef-1364-f26d-b758a78e4ff6@citrix.com>
References: <1530196528-17865-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------BE44086A4365F6EAFC36E1ED"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530196528-17865-1-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xen.org
Cc: george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, kevin.tian@intel.com, jun.nakajima@intel.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

--------------BE44086A4365F6EAFC36E1ED
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 06/28/2018 03:35 PM, Razvan Cojocaru wrote:
> A VM exit handler executed immediately after enabling #VE might
> find a stale __vmsave()d EPTP_INDEX, stored by calling
> altp2m_vcpu_destroy() when SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS
> had been enabled by altp2m_vcpu_update_vmfunc_ve().
> 
> vmx_vmexit_handler() __vmread()s EPTP_INDEX as soon as
> SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS is set, so if an
> application enables altp2m on a domain, succesfully calls
> xc_altp2m_set_vcpu_enable_notify(), then disables altp2m and
> exits, a second run of said application will likely read the
> INVALID_ALTP2M EPTP_INDEX set when disabling altp2m in the first
> run, and crash the host with the BUG_ON(idx >= MAX_ALTP2M),
> between xc_altp2m_set_vcpu_enable_notify() and
> xc_altp2m_set_domain_state(..., false).
> 
> The problem is not restricted to an INVALID_ALTP2M EPTP_INDEX
> (which can only sanely happen on altp2m uninit), but applies
> to any stale index previously saved - which means that all
> altp2m_vcpu_update_vmfunc_ve() calls must also call
> altp2m_vcpu_update_p2m() after setting
> SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS, in order to make sure
> that the stored EPTP_INDEX is always valid at
> vmx_vmexit_handler() time.

I'm sorry, this description still doesn't make hardly any sense to me,
nor the solution, even after reading all the previous threads on the
issue.  The description doesn't, for instance, mention vcpu_pause() at
all, in spite of the fact that it seems (from the previous discussion)
that this is a critical part of why this solution works; nor is there
any comment in the code about the required discipline regarding
SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS,  making it fairly likely that
someone will re-introduce a bug like this in the future.

My normal template for something like this is
1. Explain what the current situation is
2. Explain why that's a problem
3. Describe what you're changing and how it fixes it.

I can't help but think the right thing to do here is in vmx.c somewhere
-- it is, after all, code in vmx.c that:
1. Sets and clears SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS
2. Writes EPTP_INDEX
3. Assumes that SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS => EPTP_INDEX is
valid.

What about something like the attached, instead (compile-tested only)?

 -George

--------------BE44086A4365F6EAFC36E1ED
Content-Type: text/x-patch;
	name="0001-x86-altp2m-Make-sure-EPTP_INDEX-is-up-to-date-when-e.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename*0="0001-x86-altp2m-Make-sure-EPTP_INDEX-is-up-to-date-when-e.pa";
	filename*1="tch"

=46rom 03c71cda215fd9183a0fe10cb42394d63e3879c5 Mon Sep 17 00:00:00 2001
From: George Dunlap <george.dunlap@citrix.com>
Date: Fri, 20 Jul 2018 16:04:01 +0100
Subject: [PATCH] x86/altp2m: Make sure EPTP_INDEX is up-to-date when enab=
ling
 #VE

vmx_vmexit_handler() assumes that if
SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS is set, that the value in
EPTP_INDEX is valid.  Unfortunately, the function which sets this bit
(vmx_vcpu_update_vmfunc_ve) doesn't actually set EPTP_INDEX; it will
only be set the next time vmx_vcpu_update_eptp() is called.

This means that if a vcpu makes a vmexit between these two points, the
EPTP_INDEX it reads will be invalid.  The first time this race happens
for a domain, EPTP_INDEX will most likely be zero, which is the index
for the "host" p2m -- and thus is often correct.  But the second time
this race happens, the value will typically be INVALID_ALTP2M, which
will hit the following BUG:

    BUG_ON(idx >=3D MAX_ALTP2M);

Worse, if for some reason the current altp2m was *not* `0` during this
window (say, because a toolstack changed the VM to a different view),
then the accounting of active vcpus for an altp2m will be thrown off.

Fix this by always updating EPTP_INDEX to the current altp2m index
when enabling #VE.

Reported-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index bcf95f9a5f..bc25daed2c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2191,7 +2191,14 @@ static void vmx_vcpu_update_vmfunc_ve(struct vcpu =
*v)
             mfn =3D get_gfn_query_unlocked(d, gfn_x(vcpu_altp2m(v).veinf=
o_gfn), &t);
=20
             if ( !mfn_eq(mfn, INVALID_MFN) )
+            {
                 __vmwrite(VIRT_EXCEPTION_INFO, mfn_x(mfn) << PAGE_SHIFT)=
;
+                /*=20
+                 * Make sure we have an up-to-date EPTP_INDEX when
+                 * setting SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS
+                 */
+                __vmwrite(EPTP_INDEX, vcpu_altp2m(v).p2midx);
+            }
             else
                 v->arch.hvm_vmx.secondary_exec_control &=3D
                     ~SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS;
--=20
2.18.0


--------------BE44086A4365F6EAFC36E1ED
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------BE44086A4365F6EAFC36E1ED--
