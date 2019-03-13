From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH v5 1/1] cameraif: add ABI for para-virtual
 camera
Date: Wed, 13 Mar 2019 10:46:40 +0200
Message-ID: <170411d4-de33-8e0d-ab84-e5d9ae5ecf25@gmail.com>
References: <20190312082000.32181-1-andr2000@gmail.com>
 <20190312082000.32181-2-andr2000@gmail.com>
 <9e3b247e-39e6-3b87-5add-ed40b4bef731@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xeJT=RQ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1h3zXB-0002e8-7y
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 08:46:45 +0000
Received: by mail-lf1-x129.google.com with SMTP id g12so803398lfb.13
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2019 01:46:43 -0700 (PDT)
In-Reply-To: <9e3b247e-39e6-3b87-5add-ed40b4bef731@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, hverkuil@xs4all.nl
Cc: konrad.wilk@oracle.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, koji.matsuoka.xm@renesas.com, sakari.ailus@linux.intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, mchehab@kernel.org, linux-media@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzLzEyLzE5IDEwOjM4IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDEyLzAzLzIw
MTkgMDk6MjAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Cj4+
IFRoaXMgaXMgdGhlIEFCSSBmb3IgdGhlIHR3byBoYWx2ZXMgb2YgYSBwYXJhLXZpcnR1YWxpemVk
Cj4+IGNhbWVyYSBkcml2ZXIgd2hpY2ggZXh0ZW5kcyBYZW4ncyByZWFjaCBtdWx0aW1lZGlhIGNh
cGFiaWxpdGllcyBldmVuCj4+IGZhcnRoZXIgZW5hYmxpbmcgaXQgZm9yIHZpZGVvIGNvbmZlcmVu
Y2luZywgSW4tVmVoaWNsZSBJbmZvdGFpbm1lbnQsCj4+IGhpZ2ggZGVmaW5pdGlvbiBtYXBzIGV0
Yy4KPj4KPj4gVGhlIGluaXRpYWwgZ29hbCBpcyB0byBzdXBwb3J0IG1vc3QgbmVlZGVkIGZ1bmN0
aW9uYWxpdHkgd2l0aCB0aGUKPj4gZmluYWwgaWRlYSB0byBtYWtlIGl0IHBvc3NpYmxlIHRvIGV4
dGVuZCB0aGUgcHJvdG9jb2wgaWYgbmVlZCBiZToKPj4KPj4gMS4gUHJvdmlkZSBtZWFucyBmb3Ig
YmFzZSB2aXJ0dWFsIGRldmljZSBjb25maWd1cmF0aW9uOgo+PiAgIC0gcGl4ZWwgZm9ybWF0cwo+
PiAgIC0gcmVzb2x1dGlvbnMKPj4gICAtIGZyYW1lIHJhdGVzCj4+IDIuIFN1cHBvcnQgYmFzaWMg
Y2FtZXJhIGNvbnRyb2xzOgo+PiAgIC0gY29udHJhc3QKPj4gICAtIGJyaWdodG5lc3MKPj4gICAt
IGh1ZQo+PiAgIC0gc2F0dXJhdGlvbgo+PiAzLiBTdXBwb3J0IHN0cmVhbWluZyBjb250cm9sCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5k
cnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgpUaGFuayB5b3UsCkknbGwgd2FpdCB0aWxsIHRoZSBuZXh0IHdlZWsgZm9yIGFu
eSBvdGhlciBjb21tZW50cyBhbmQgaWYgdGhlcmUKYXJlIG9ubHkgdGhvc2UgZnJvbSBIYW5zIHRo
ZW4gSSdsbCBwdXNoIChmaW5hbD8pIHY2Cj4KPiBKdWVyZ2VuClRoYW5rIHlvdSwKT2xla3NhbmRy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
