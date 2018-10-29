From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH V3 1/3] x86/altp2m: propagate ept.ad changes
 to all active altp2ms
Date: Mon, 29 Oct 2018 09:33:27 -0600
Message-ID: <CABfawhn1gKUDcy34Kr-1tucq3RVtPd02+mHepA-7R8KkeD86Kw@mail.gmail.com>
References: <1540816837-8936-1-git-send-email-rcojocaru@bitdefender.com>
 <1540816837-8936-2-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8gpi=nj=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gH9YM-0003V5-Cb
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 15:34:06 +0000
Received: by mail-wm1-x342.google.com with SMTP id a8-v6so8385392wmf.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Oct 2018 08:34:05 -0700 (PDT)
In-Reply-To: <1540816837-8936-2-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgNjo0MiBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBpcyBhIHByZS1yZXF1aXNp
dGUgZm9yIGZpeGluZyB0aGUgbG9nZGlydHkgVkdBIGlzc3VlCj4gKGRpc3BsYXkgZnJlZXplcyB3
aGVuIHN3aXRjaGluZyB0byBhIG5ldyBhbHRwMm0gdmlldyBlYXJseSBpbiBhCj4gZG9tYWluJ3Mg
bGlmZXRpbWUpLCBidXQgc2VudCBzZXBhcmF0ZWx5IGZvciBlYXNpZXIgcmV2aWV3Lgo+IFRoZSBu
ZXcgZXB0X3NldF9hZF9zeW5jKCkgZnVuY3Rpb24gaGFzIGJlZW4gYWRkZWQgdG8gdXBkYXRlIGFs
bAo+IGFjdGl2ZSBhbHRwMm1zJyBlcHQuYWQuIE5ldyBhbHRwMm1zIHdpbGwgaW5oZXJpdCB0aGUg
aG9zdHAybSdzCj4gZXB0LmFkIHZhbHVlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9j
YXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IFN1Z2dlc3RlZC1ieTogR2VvcmdlIER1
bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKVGVzdGVkLWJ5OiBUYW1hcyBLIExlbmd5
ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
