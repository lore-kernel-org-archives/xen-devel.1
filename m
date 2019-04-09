From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH] xen/cameraif: add ABI for para-virtual
 camera
Date: Tue, 9 Apr 2019 12:33:36 +0300
Message-ID: <5bb8c828-b0ae-86c3-dacf-88bf6032dd6f__9569.93740271486$1554802476$gmane$org@gmail.com>
References: <20190409091546.9606-1-andr2000@gmail.com>
 <9b9ba6b9-f045-80e2-fe8a-595728fb1ec0@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PY99=SL=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hDn8O-00064b-CR
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 09:33:40 +0000
Received: by mail-lj1-x243.google.com with SMTP id v22so13817266lje.9
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 02:33:39 -0700 (PDT)
In-Reply-To: <9b9ba6b9-f045-80e2-fe8a-595728fb1ec0@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, konrad.wilk@oracle.com, hverkuil@xs4all.nl, boris.ostrovsky@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC85LzE5IDEyOjI4IFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDA5LzA0LzIwMTkg
MTE6MTUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9tOiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Cj4+IFRo
aXMgaXMgdGhlIEFCSSBmb3IgdGhlIHR3byBoYWx2ZXMgb2YgYSBwYXJhLXZpcnR1YWxpemVkCj4+
IGNhbWVyYSBkcml2ZXIgd2hpY2ggZXh0ZW5kcyBYZW4ncyByZWFjaCBtdWx0aW1lZGlhIGNhcGFi
aWxpdGllcyBldmVuCj4+IGZ1cnRoZXIgZW5hYmxpbmcgaXQgZm9yIHZpZGVvIGNvbmZlcmVuY2lu
ZywgSW4tVmVoaWNsZSBJbmZvdGFpbm1lbnQsCj4+IGhpZ2ggZGVmaW5pdGlvbiBtYXBzIGV0Yy4K
Pj4KPj4gVGhlIGluaXRpYWwgZ29hbCBpcyB0byBzdXBwb3J0IG1vc3QgbmVlZGVkIGZ1bmN0aW9u
YWxpdHkgd2l0aCB0aGUKPj4gZmluYWwgaWRlYSB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIGV4dGVu
ZCB0aGUgcHJvdG9jb2wgaWYgbmVlZCBiZToKPj4KPj4gMS4gUHJvdmlkZSBtZWFucyBmb3IgYmFz
ZSB2aXJ0dWFsIGRldmljZSBjb25maWd1cmF0aW9uOgo+PiAgIC0gcGl4ZWwgZm9ybWF0cwo+PiAg
IC0gcmVzb2x1dGlvbnMKPj4gICAtIGZyYW1lIHJhdGVzCj4+IDIuIFN1cHBvcnQgYmFzaWMgY2Ft
ZXJhIGNvbnRyb2xzOgo+PiAgIC0gY29udHJhc3QKPj4gICAtIGJyaWdodG5lc3MKPj4gICAtIGh1
ZQo+PiAgIC0gc2F0dXJhdGlvbgo+PiAzLiBTdXBwb3J0IHN0cmVhbWluZyBjb250cm9sCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4KPj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
Pj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPj4g
Q2M6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPgo+IEknbSBpbiBwcmluY2lwbGUg
ZmluZSB3aXRoIHRoaXMgcGF0Y2gsIGJ1dCBpdCBzaG91bGQgYmUgc2VudCBhcyBwYXJ0IG9mCj4g
YSBzZXJpZXMgdXNpbmcgdGhhdCBoZWFkZXIuIEluIGNhc2UgdGhlIHJlbGF0ZWQgZHJpdmVyIGlz
bid0IGFjY2VwdGVkCj4gd2UnZCBlbmQgdXAgd2l0aCBhIHN0YWxlIGhlYWRlciBmaWxlLgpIbSwg
SSBhbSBkb2luZyB0aGlzIGFzIEkgZGlkIGZvciB0aGUgcmVzdCBvZiBwcm90b2NvbHMgYmVmb3Jl
OgoxLiBHZXQgdGhlIHByb3RvY29sIGluIFhlbgoyLiBHZXQgdGhlIGNvcHkgaW4gTGludXgKMy4g
VXBzdHJlYW0gZHJpdmVyICh1c2UgaGVhZGVyKQoKRXZlbiBpZiB0aGUgZHJpdmVyIGlzIG5vdCBh
Y2NlcHRlZCAoaG9wZSB0aGlzIHdvbid0IGhhcHBlbikKdGhlbiB0aGlzIHBhdGNoIG1ha2VzIFhl
biBhbmQgTGludXggcHJvcGVybHkgYWxpZ25lZCBhbnl3YXkuCldoaWNoIGlzIElNTyBnb29kCj4K
PiBKdWVyZ2VuClRoYW5rIHlvdSwKT2xla3NhbmRyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
