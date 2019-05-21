From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH MM-PART2 RESEND v2 01/19] xen/const: Extend
 the existing macro BIT to take a suffix in parameter
Date: Tue, 21 May 2019 13:01:13 +0300
Message-ID: <af657af7-ad1e-1f23-95d6-3d8e133af686@gmail.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201443320.16404@sstabellini-ThinkPad-T480s>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wdSZ=TV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hT1aA-00039g-WC
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:01:19 +0000
Received: by mail-lj1-x241.google.com with SMTP id m15so5972886ljg.13
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2019 03:01:17 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.21.1905201443320.16404@sstabellini-ThinkPad-T480s>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: Andrii_Anisov@epam.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Oleksandr_Tyshchenko@epam.com, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMS4wNS4xOSAwMDo0MywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwg
MTQgTWF5IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQXJtIGN1cnJlbnRseSBwcm92aWRl
cyB0d28gbWFjcm8gQklUIGFuZCBCSVRfVUxMIHRoYXQgYXJlIG9ubHkgdXNhYmxlCj4+IGluIEMg
YW5kIHJldHVybiByZXNwZWN0aXZlbHkgdW5zaWduZWQgbG9uZyBhbmQgdW5zaWduZWQgbG9uZyBs
b25nLgo+Pgo+PiBFeHRlbmRpbmcgdGhlIG1hY3JvcyB0byBkZWFsIHdpdGggYXNzZW1ibHkgd291
bGQgYmUgYSBuaWNlIGJlbmVmaXRzIGFzCj4+IGl0IGNvdWxkIHJlcGxhY2UgdGhlIGNvbW1vbiBw
YXR0ZXJuIHRvIGRlZmluZSBmaWVsZHMgKEFDKDEsIHNmeCkgPDwgWCkKPj4gZWFzaWVyIHRvIHJl
YWQuCj4+Cj4+IFJhdGhlciB0aGFuIGV4dGVuZGluZyB0aGUgdHdvIG1hY3JvcywgaXQgd2FzIGRl
Y2lkZWQgdG8gZHJvcCBCSVRfVUxMKCkKPj4gYW5kIGV4dGVuZCB0aGUgbWFjcm8gQklUKCkgdG8g
dGFrZSBhIHN1ZmZpeCAoZS5nIFUsIFVMLCBVTEwpIGluCj4+IHBhcmFtZXRlci4gVGhpcyB3b3Vs
ZCBhbGxvdyB0byB1c2UgZGlmZmVyZW50IHN1ZmZpeCB3aXRob3V0IGhhdmluZyB0bwo+PiBkZWZp
bmUgbmV3IG1hY3Jvcy4KPj4KPj4gVGhlIG5ldyBleHRlbmQgbWFjcm8gaXMgbm93IG1vdmVkIGlu
IGluY2x1ZGUveGVuL2NvbnN0Lmggc28gaXQgY2FuIGJlCj4+IHVzZWQgYnkgYW55b25lIGluIFhl
biBhbmQgYWxzbyBhdm9pZCB0byBpbmNsdWRlIGJpdG9wcy5oIGluIGFzc2VtYmx5Cj4+IGNvZGUu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CiAgClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoK
LS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
