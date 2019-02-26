From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v10 4/6] xen/x86: use DEFINE_SYMBOL as
 required
Date: Tue, 26 Feb 2019 17:13:58 +0000
Message-ID: <23669.29654.253921.9395@mariner.uk.xensource.com>
References: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
 <1551127822-25886-4-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ku3n=RB=citrix.com=prvs=95365f554=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gygJ4-0004Q5-0d
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 17:14:14 +0000
In-Reply-To: <1551127822-25886-4-git-send-email-sstabellini@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "JBeulich@suse.com" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIltQQVRDSCB2MTAgNC82XSB4ZW4veDg2OiB1c2Ug
REVGSU5FX1NZTUJPTCBhcyByZXF1aXJlZCIpOgo+IFVzZSBTWU1CT0xTX1NVQlRSQUNUIGFuZCBT
WU1CT0xTX0NPTVBBUkUgaW4gY2FzZXMgb2YgY29tcGFyaXNvbnMgYW5kCj4gc3VidHJhY3Rpb25z
IG9mOgouLi4KPiBVc2UgZXhwbGljaXQgY2FzdHMgdG8gdWludHB0cl90IHdoZW4gaXQgaXMgbm90
IHBvc3NpYmxlIHRvIHVzZSB0aGUKPiBwcm92aWRlZCBzdGF0aWMgaW5saW5lIGZ1bmN0aW9ucy4K
CldoeSBpcyBpdCBub3QgcG9zc2libGUgPyAgWW91IHdyaXRlOgoKPiArLyoKPiArICogQ2Fubm90
IHVzZSBERUZJTkVfU1lNQk9MIGJlY2F1c2Ugb2YgdGhlIHdheSB0aGV5IGFyZSBwYXNzZWQgdG8K
PiArICogYXBwbHlfYWx0ZXJuYXRpdmVzLgo+ICsgKi8KPiAgZXh0ZXJuIHN0cnVjdCBhbHRfaW5z
dHIgX19hbHRfaW5zdHJ1Y3Rpb25zW10sIF9fYWx0X2luc3RydWN0aW9uc19lbmRbXTsKCkJ1dCBJ
IGRvbid0IGtub3cgd2h5IHlvdSBjYW4ndCBwYXNzIGEgYHN0cnVjdCBhYnN0cmFjdF9hbHRfaW5z
dHIqJyB0bwphcHBseV9hbHRlcm5hdGl2ZXMuCgpJTU8gaXQgc2hvdWxkIGJlIHN0cmljdGx5IGZv
cmJpZGRlbiB0byBldmVyIHdyaXRlIHRoaXMgZm9ybXVsYXRpb24sIGFzCnlvdSBoYXZlIGFib3Zl
LiAgU2VlIG15IHByb3Bvc2VkIHJ1bGUgY29tbWVudCBmb3IgREVGSU5FX1NZTUJPTC4KCkV2ZW4g
aWYgeW91IGNhbid0IHVzZSB0aGUgbWFjcm9zIGF0IHNvbWUgcGFydGljdWxhciBjYWxjdWxhdGlv
biBzaXRlLAp5b3Ugc2hvdWxkIHN0aWxsIGVuc3VyZSB0aGF0IC4uLl9lbmQgaGFzIGEgZGlmZmVy
ZW50IHR5cGUsIHRvIG1ha2UKc3VyZSB0aGF0IG5vIHVuc2FmZSB1c2VzIGVzY2FwZS4KCgpGVFIs
IEkgaGF2ZSBub3QgcmV2aWV3ZWQgdGhlIHJlc3Qgb2YgdGhpcyBwYXRjaCB5ZXQuCgpJYW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
