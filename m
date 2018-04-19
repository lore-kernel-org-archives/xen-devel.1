From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] shim: don't let build modify shim.config
Date: Thu, 19 Apr 2018 13:01:53 +0200
Message-ID: <be2a5e99-6695-aa53-7690-0d19b2b76a09@suse.com>
References: <20180419103024.14731-1-jgross@suse.com>
 <5AD873C502000078001BCA14@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gvlu=hi=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f97KB-00031T-Js
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 11:01:59 +0000
In-Reply-To: <5AD873C502000078001BCA14@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDQvMTggMTI6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjA0LjE4IGF0
IDEyOjMwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUv
eGVuLWRpci9NYWtlZmlsZQo+PiArKysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxl
Cj4+IEBAIC00MSwyMSArNDEsMjIgQEAgbGlua2Zhcm0uc3RhbXA6ICQoREVQX0RJUlMpICQoREVQ
X0ZJTEVTKSBGT1JDRQo+PiAgJChEKTogbGlua2Zhcm0uc3RhbXAKPj4gIAkkKE1BS0UpIC1DICQo
RCkveGVuIGRpc3RjbGVhbgo+PiAgCj4+IC0uUEhPTlk6IHNoaW0tJWNvbmZpZwo+PiAtc2hpbS0l
Y29uZmlnOiAkKEQpIEZPUkNFCj4+IC0JJChNQUtFKSAtQyAkKEQpL3hlbiAkKmNvbmZpZyBcCj4g
Cj4gSSB0aGluayB0aGVyZSB3YXMgYSByZWFzb24gZm9yIHRoZSAlIGFuZCAkKi4KClRoZSBvbmx5
IG9uZSBJIGNvdWxkIHRoaW5rIG9mIGlzIHRoZSBwb3NzaWJpbGl0eSB0byBkbwoKbWFrZSBzaGlt
LWRlZmF1bHRjb25maWcKCm9yIHNpbWlsYXIgY2FsbHMuIFF1ZXN0aW9uIGlzIHdobyB3aWxsIGV2
ZXIgbmVlZCB0aGF0LiBJbiBjYXNlIGl0IGlzCmJlbGlldmVkIHRvIGJlIHZhbHVhYmxlIEkgY2Fu
IGtlZXAgaXQuCgo+PiAreGVuLXNoaW0uY29uZmlnOiBzaGltLmNvbmZpZwo+PiArCWNwICQ8ICRA
Cj4gCj4gV2h5IG5vdCBjb3B5IGl0IHRvIHdoZXJlIGl0IGFjdHVhbGx5IGJlbG9uZyAtIHhlbi8u
Y29uZmlnPwoKSG1tLCB0cnVlLiBJbiBjYXNlIG5vYm9keSBvYmplY3RzIEknbGwgZG8gdGhhdC4K
CgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
