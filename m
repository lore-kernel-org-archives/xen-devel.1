From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] libxl_dm: Replace deprecated -drive if=scsi
Date: Tue, 27 Mar 2018 16:42:20 +0100
Message-ID: <20180327154220.GF2208@perard>
References: <20180326173810.12818-1-anthony.perard@citrix.com>
 <23226.23516.344493.533090@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sg2s=gr=citrix.com=prvs=61706adb2=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1f0qjw-0000ue-GZ
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 15:42:24 +0000
Content-Disposition: inline
In-Reply-To: <23226.23516.344493.533090@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjcsIDIwMTggYXQgMDM6NTc6MzJQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIXSBsaWJ4bF9kbTogUmVwbGFjZSBk
ZXByZWNhdGVkIC1kcml2ZSBpZj1zY3NpIik6Cj4gPiAuLiBieSAtZHJpdmUgaWY9bm9uZSwuLiAt
ZGV2aWNlIHNjc2ktZGlzaywuLi4KPiA+IAo+ID4gVGhlIHVzZSBvZiBpZj1zY3NpIGluIFFFTVUg
aXMgZGVwcmVjYXRlZCBhbmQgaGFzIGJlZW4gcmVtb3ZlZCBpbiAyLjEyIGJ5Cj4gPiAxNDU0NTA5
NzI2IHNjc2k6IFJlbW92ZSBhdXRvbWF0aWMgY3JlYXRpb24gb2YgU0NTSSBjb250cm9sbGVycyB3
aXRoIC1kcml2ZSBpZj1zY3NpCj4gCj4gQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgo+IAo+IERZSyB3aGVuIHRoZSBuZXcgc3ludGF4IGJlY2FtZSBhdmFp
bGFibGUgPyAgV2UgbWF5IG5lZWQgdG8gbWVudGlvbgo+IHRoYXQgYXMgYSBkZXBlbmRlbmN5LgoK
QXMgZmFyIGFzIEkgY2FuIHRlbGwsIHRoZSBuZXcgc3ludGF4IGlzIG5vdCBuZXcuIEl0IGFzIGFs
d2F5cyBiZWVuCmF2YWlsYWJsZS4gV2UgYWxyZWFkeSB1c2UgIi1kZXZpY2UiLCBhbmQgYm90aCAi
c2NzaS1kaXNrIiBhbmQgImxzaS4uIgpoYXZlIGJlZW4gYXZhaWxhYmxlIGFuZCB1c2VkIGludGVy
bmFsbHkgYnkgUUVNVSBiZWZvcmUgMS4wLiAgQW5kICItZHJpdmUKaWY9bm9uZSIgaGFzIGFsc28g
YmVlbiBhdmFpbGFibGUgYnkgMS4wLgoKU28gSSBkb24ndCB0aGluayB3ZSBuZWVkIHRvIG1lbnRp
b24gYW55dGhpbmcgbmV3IHJlZ2FyZGluZyBkZXBlbmRlbmN5LgoKVGhhbmtzLAoKLS0gCkFudGhv
bnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
