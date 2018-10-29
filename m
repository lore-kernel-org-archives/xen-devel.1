From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [PATCH V3 3/3] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Mon, 29 Oct 2018 09:33:55 -0600
Message-ID: <CABfawh=w-NXsKf5jzGLobj46MqSk=1fy=ruzEZ6OuTvqLY9Ctw@mail.gmail.com>
References: <1540816837-8936-1-git-send-email-rcojocaru@bitdefender.com>
 <1540816837-8936-4-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8gpi=nj=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gH9Yp-0003Zx-1Q
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 15:34:35 +0000
Received: by mail-wr1-x443.google.com with SMTP id x12-v6so9175947wrw.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Oct 2018 08:34:33 -0700 (PDT)
In-Reply-To: <1540816837-8936-4-git-send-email-rcojocaru@bitdefender.com>
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

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgNjo0MSBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gV2hlbiBhbiBuZXcgYWx0cDJtIHZpZXcgaXMg
Y3JlYXRlZCB2ZXJ5IGVhcmx5IG9uIGd1ZXN0IGJvb3QsIHRoZQo+IGRpc3BsYXkgd2lsbCBmcmVl
emUgKGFsdGhvdWdoIHRoZSBndWVzdCB3aWxsIHJ1biBub3JtYWxseSkuIFRoaXMKPiBtYXkgYWxz
byBoYXBwZW4gb24gcmVzaXppbmcgdGhlIGRpc3BsYXkuIFRoZSByZWFzb24gaXMgdGhlIHdheQo+
IFhlbiBjdXJyZW50bHkgKG1pcyloYW5kbGVzIGxvZ2RpcnR5IFZHQTogaXQgaW50ZW50aW9uYWxs
eQo+IG1pc2NvbmZpZ3VyZXMgVkdBIHBhZ2VzIHNvIHRoYXQgdGhleSB3aWxsIGZhdWx0Lgo+Cj4g
VGhlIHByb2JsZW0gaXMgdGhhdCBpdCBvbmx5IGRvZXMgdGhpcyBpbiB0aGUgaG9zdCBwMm0uIE9u
Y2Ugd2UKPiBzd2l0Y2ggdG8gYSBuZXcgYWx0cDJtLCB0aGUgbWlzY29uZmlndXJlZCBlbnRyaWVz
IHdpbGwgbm8gbG9uZ2VyCj4gZmF1bHQsIHNvIHRoZSBkaXNwbGF5IHdpbGwgbm90IGJlIHVwZGF0
ZWQuCj4KPiBUaGlzIHBhdGNoOgo+ICogdXBkYXRlcyBlcHRfaGFuZGxlX21pc2NvbmZpZygpIHRv
IHVzZSB0aGUgYWN0aXZlIGFsdHAybSBpbnN0ZWFkCj4gICBvZiB0aGUgaG9zdHAybTsKPiAqIG1v
ZGlmaWVzIHAybV9jaGFuZ2VfZW50cnlfdHlwZV9nbG9iYWwoKSwgcDJtX21lbW9yeV90eXBlX2No
YW5nZWQKPiAgIGFuZCBwMm1fY2hhbmdlX3R5cGVfcmFuZ2UoKSB0byBwcm9wYWdhdGUgdGhlaXIg
Y2hhbmdlcyB0byBhbGwKPiAgIHZhbGlkIGFsdHAybXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYXp2
YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+Cj4gU3VnZ2VzdGVkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpUZXN0ZWQtYnk6IFRhbWFz
IEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
