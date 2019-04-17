From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: Arm boot regression with Xen 4.12
Date: Wed, 17 Apr 2019 13:32:33 +0530
Message-ID: <CABHD4K_ysgy=_sC2S0Dh83HHykmQYAR9DYk=aRBi=HTBFPUupg@mail.gmail.com>
References: <CABHD4K_TGznSkuX8T0tuBpqkcJnyyDtxrfa0YHGvz_t0BE3fAQ@mail.gmail.com>
 <6b603d55-5823-b203-45eb-a0dd61ef81ee@arm.com>
 <CABHD4K_tXgNpWT4UChTbCbu4X8C3HjuFSig1Se0WuMrzMV0tyQ@mail.gmail.com>
 <18d6524d-8dd9-2c0b-34b3-bdb7316bebae@arm.com>
 <CABHD4K9rj354gW=8Q_PAtQ02R+pZdUnhzfwrG3Zq=-XmDE8XfA@mail.gmail.com>
 <a1f50f9c-1f14-9816-88f2-2a11dffdf6db@arm.com>
 <CABHD4K9JGxPCV==0zkA80dZKrrsTvNQXqgwt7nenmayT-hN57Q@mail.gmail.com>
 <15bb0374-f1dc-2392-25a8-c13815ef4a0c@arm.com>
 <ca967222-50be-a402-c5ef-f1662e301905@arm.com>
 <CABHD4K_1BRuWLpDJEAWmMxqSYXyyE2ToW_dT754q3co5r1EB9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFY8=ST=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hGfWq-0003Ye-CT
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 08:02:48 +0000
Received: by mail-ot1-x331.google.com with SMTP id m10so19967285otp.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 01:02:46 -0700 (PDT)
In-Reply-To: <CABHD4K_1BRuWLpDJEAWmMxqSYXyyE2ToW_dT754q3co5r1EB9w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, peng.fan@nxp.com, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpPbiBGcmksIE1hciAyMiwgMjAxOSBhdCA1OjA1IFBNIEFtaXQgVG9tZXIgPGFtaXR0
b21lcjI1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+Cj4gPiBJIGFtIHdvbmRlcmluZyBp
ZiB5b3UgaGFkIHRpbWUgdG8gYmlzZWN0IHRoZSBpc3N1ZT8KPiA+Cj4gPiBXZSBhcmUgcmVsZWFz
aW5nIFhlbiA0LjEyIHNvb24gc28gd2UgbmVlZCB0byBtYWtlIHRoZSBkZWNpc2lvbiB3aGV0aGVy
IHRoaXMKPiA+IHNob3VsZCBiZSBmaXhlZCBhZnRlciAoYW5kIGJhY2twb3J0IGl0KSBvciBiZWZv
cmUuCgpEb24ndCBzZWUgdGhpcyBjcmFzaCBpZiBJIGNob3NlIHRvIGhhdmUgZGlmZmVyZW50IGxv
YWQgYWRkcmVzc2VzKExvYWQKa2VybmVsIGF0IDIgTUIgYWxpZ25lZCBhZGRyZXNzKS4KRm9yIGlu
c3RhbmNlLCB1c2luZwoKInNldGVudiB4ZW5fYWRkcl9yIDB4NDA0ODAwMDAgO3NldGVudiBmZHRf
YWRkcl9yIDB4NDMwMDAwMDA7c2V0ZW52Cmtlcm5lbF9hZGRyX3IgMHg0MTAwMDAwMCIKIGluc3Rl
YWQgb2YKInNldGVudiB4ZW5fYWRkcl9yIDB4NDIwMDAwMDAgO3NldGVudiBmZHRfYWRkcl9yIDB4
NDMwMDAwMDA7c2V0ZW52Cmtlcm5lbF9hZGRyX3IgMHg0MDQ4MDAwMCIKCkFsbG93IGl0IGJvb3Qg
cHJvcGVybHkoVGVzdGVkIGl0IHdpdGggNC4xMykuCgpUaGFua3MKLUFtaXQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
