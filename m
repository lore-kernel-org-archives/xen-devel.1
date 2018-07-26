From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] hvm/altp2m: Clarify the proper way to
 extend the altp2m interface
Date: Thu, 26 Jul 2018 16:59:30 +0100
Message-ID: <20180726155930.dalo6qkxh4dcza3s@citrix.com>
References: <20180723170951.6852-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xz6m=kk=citrix.com=prvs=738467b65=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiifv-0003rY-5M
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 15:59:35 +0000
Content-Disposition: inline
In-Reply-To: <20180723170951.6852-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Tamas K Lengyel <tamas.lengyel@zentific.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMjMsIDIwMTggYXQgMDY6MDk6NTFQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiAgCj4gKy8qCj4gKyAqIGFsdHAybSBvcGVyYXRpb25zIGFyZSBlbnZpc2lvbmVkIGFz
IGJlaW5nIHVzZWQgaW4gc2V2ZXJhbCBkaWZmZXJlbnQgCj4gKyAqIG1vZGVzOgo+ICsgKiAKPiAr
ICogLSBleHRlcm5hbDogQWxsIGNvbnRyb2wgYW5kIGRlY2lzaW9ucyBhcmUgbWFkZSBieSBhbiBl
eHRlcm5hbCBhZ2VudAo+ICsgKiAgIHJ1bm5pbmcgZG9tYWluIDAuCj4gKyAqCj4gKyAqIC0gaW50
ZXJuYWw6IGFsdHAybSBvcGVyYXRpb25zIGFyZSB1c2VkIGV4Y2x1c2l2ZWx5IGJ5IGFuIGluLWd1
ZXN0Cj4gKyAqICAgYWdlbnQgdG8gcHJvdGVjdCBpdHNlbGYgZnJvbSB0aGUgZ3Vlc3Qga2VybmVs
IGFuZCBpbi1ndWVzdAo+ICsgKiAgIGF0dGFja2Vycy4KPiArICogCj4gKyAqIC0gY29vcmRpbmF0
ZWQ6IEFuIGluLWd1ZXN0IGFnZW50IGhhbmRsZXMgI1ZFIGFuZCBWTUZVTkNzIGxvY2FsbHksCj4g
KyAqICAgYnV0IG1ha2VzIHJlcXVlc3RzIG9mIGFuIGFnZW50IHJ1bm5pbmcgb3V0c2lkZSB0aGUg
ZG9tYWluIGZvcgo+ICsgKiAgIGJpZ2dlciBjaGFuZ2VzIChzdWNoIGFzIG1vZGlmeWluZyBhbHRw
Mm0gZW50aXJlcykuCj4gKyAqCj4gKyAqIFRoaXMgY29ycmVzcG9uZHMgdG8gdGhlIHRocmVlIHZh
bHVlcyBmb3IgSFZNX1BBUkFNX0FMVFAyTQo+ICsgKiAoZXh0ZXJuYWwsIG1peGVkLCBsaW1pdGVk
KS4gQWxsIHRocmVlIG1vZGVscyBoYXZlIGFkdmFudGFnZXMgYW5kCj4gKyAqIGRpc2FkdmFudGFn
ZXMuCj4gKyAqCj4gKyAqIE5vcm1hbGx5IGh5cGVyY2FsbHMgbWFkZSBieSBhIHByb2dyYW0gaW4g
ZG9tYWluIDAgaW4gb3JkZXIgdG8KPiArICogY29udHJvbCBhIGd1ZXN0IHdvdWxkIGJlIERPTUNU
THMgcmF0aGVyIHRoYW4gSFZNT1BzLiAgQnV0IGluIG9yZGVyCj4gKyAqIHRvIHByb3Blcmx5IGVu
YWJsZSB0aGUgJ2ludGVybmFsJyB1c2UgY2FzZSwgYXMgd2VsbCBhcyB0byBhdm9pZAo+ICsgKiBm
cmFnbWVudGF0aW9uLCBhbGwgYWx0cDJtIHN1Ym9wcyBzaG91bGQgY29tZSB1bmRlciB0aGlzIHNp
bmdsZQo+ICsgKiBIVk1PUC4KPiArICogCj4gKyAqIE5vdGUgdGhhdCAnaW50ZXJuYWwnIG1vZGUg
KEhWTV9QQVJBTV9BTFRQMk0gPT0gWEVOX0FMVFAyTV9taXhlZCkKPiArICogaGFzIG5vdCBiZWVu
IGV2YWx1YXRlZCBmb3Igc2FmZXR5IGZyb20gYSBzZWN1cml0eSBwZXJzcGVjdGl2ZS4KPiArICog
QmVmb3JlIHVzaW5nIHRoaXMgbW9kZSBpbiBhIHNlY3VyaXR5LWNyaXRpY2FsIGVudmlyb25tZW50
LCBlYWNoCj4gKyAqIHN1Ym9wIHNob3VsZCBiZSBldmFsdWF0ZWQgZm9yIHNhZmV0eSwgd2l0aCB1
bnNhZmUgc3Vib3BzCj4gKyAqIGJsYWNrbGlzdGVkIGluIHhzbV9odm1fYWx0cDJtaHZtX29wKCku
Cj4gKyAqLwoKVGhpcyBsb29rcyByZWFzb25hYmxlIHRvIG1lLiBJIGRvbid0IHdvbmRlciB3aGV0
aGVyIHRoZSBsYXN0IHBhcmFncmFwaApzaG91bGQgYWxzbyBiZSBjb3BpZWQgdG8gdGhlIHB1Ymxp
YyBoZWFkZXIuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
