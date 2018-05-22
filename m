From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: correct mtrr_pat_not_equal()
Date: Tue, 22 May 2018 14:52:16 +0100
Message-ID: <f15f7086-4e30-9a2a-1037-5ce3f1678af0@citrix.com>
References: <5B04201602000078001C4B63@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hqog=ij=citrix.com=prvs=673819711=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fL7i9-0006Xx-6t
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 13:52:21 +0000
In-Reply-To: <5B04201602000078001C4B63@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMTggMTQ6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZSB0d28gdkNQVS1zIGRp
ZmZlcmluZyBpbiBNVFJSLWVuYWJsZWQgc3RhdGUgbWVhbnMgTVRSUiBzZXR0aW5ncyBhcmUKPiBu
b3QgZXF1YWwuIEJvdGggdkNQVS1zIGhhdmluZyBNVFJScyBkaXNhYmxlZCBtZWFucyBvbmx5IFBB
VCBuZWVkcyB0byBiZQo+IGNvbXBhcmVkLiBBbG9uZyB0aG9zZSBsaW5lcyBmb3IgZml4ZWQgcmFu
Z2UgTVRSUnMuIERpZmZlcmluZyB2YXJpYWJsZQo+IHJhbmdlIGNvdW50cyBsaWtld2lzZSBtZWFu
IHNldHRpbmdzIGFyZSBkaWZmZXJlbnQgb3ZlcmFsbCAoZXZlbiBpZgo+IHRoYXQncyBub3QgYSB2
ZXJ5IHJlYXNvbmFibGUgc2V0dXAgdG8gaGF2ZSkuCj4KPiBDb25zdGlmeSB0eXBlcyBhbmQgY29u
dmVydCBib29sX3QgdG8gYm9vbC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
