From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Wed, 18 Apr 2018 10:11:58 +0200
Message-ID: <CACRpkdZNm54ukoggpta4o5XfALryHSO4Ptx0EhzNDG5HLLSSRw__30862.9275685691$1524039233$gmane$org@mail.gmail.com>
References: <1523920175-27287-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=h0mg=hh=linaro.org=linus.walleij@srs-us1.protection.inumbo.net>)
 id 1f8iC9-0001a9-AW
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 08:12:01 +0000
Received: by mail-io0-x229.google.com with SMTP id a7-v6so1375596ioc.12
 for <xen-devel@lists.xenproject.org>; Wed, 18 Apr 2018 01:11:59 -0700 (PDT)
In-Reply-To: <1523920175-27287-1-git-send-email-maran.wilson@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, jgross@suse.com, Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, pbonzini@redhat.com, "David S. Miller" <davem@davemloft.net>, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

SSB3b25kZXIgd2h5IEkgYW0gc3RhcnRpbmcgdG8gZ2V0IENDZWQgb24gWGVuIHBhdGNoZXMgYWxs
IG9mIGEgc3VkZGVuLgoKSSBoYXBwZW5lZCB0byBydW4gaW50byBKw7xyZ2VuIGF0IGEgY29uZmVy
ZW5jZSBvbmx5IGxhc3Qgd2Vla2VuZCwgYnV0Ckkgc3RpbGwgZG9uJ3Qga25vdyBhbnl0aGluZyB3
aGF0c29ldmVyIGFib3V0IFhlbiBvciBob3cgaXQgd29ya3MuCgpJZiBnZXRfbWFpbnRhaW5lci5w
bCBoYXMgc3RhcnRlZCB0byByZXR1cm4gbXkgbmFtZSBvbiB0aGlzIHN0dWZmIEkKcmVhbGx5IHdh
bnQgdG8ga25vdyB3aHkgOi8KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
