From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH][next] xen/gntdev: don't dereference a null
 gntdev_dmabuf on allocation failure
Date: Tue, 31 Jul 2018 13:09:08 -0400
Message-ID: <524db07f-2e88-5ae1-f748-4f86506eeeb6__16648.8301860683$1533056857$gmane$org@oracle.com>
References: <20180731140225.22717-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vyvo=kp=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fkY8i-0008Pf-Dq
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 17:08:52 +0000
In-Reply-To: <20180731140225.22717-1-colin.king@canonical.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Colin King <colin.king@canonical.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMzEvMjAxOCAxMDowMiBBTSwgQ29saW4gS2luZyB3cm90ZToKPiBGcm9tOiBDb2xpbiBJ
YW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+Cj4gQ3VycmVudGx5IHdoZW4gdGhl
IGFsbG9jYXRpb24gb2YgZ250ZGV2X2RtYWJ1ZiBmYWlscywgdGhlIGVycm9yIGV4aXQKPiBwYXRo
IHdpbGwgY2FsbCBkbWFidWZfaW1wX2ZyZWVfc3RvcmFnZSBhbmQgY2F1c2VzIGEgbnVsbCBwb2lu
dGVyCj4gZGVyZWZlcmVuY2Ugb24gZ250ZGV2X2RtYWJ1Zi4gIEZpeCB0aGlzIGJ5IGFkZGluZyBh
biBlcnJvciBleGl0IHBhdGgKPiB0aGF0IHdvbid0IGZyZWUgZ250ZGV2X2RtYWJ1Zi4KPgo+IERl
dGVjdGVkIGJ5IENvdmVyaXR5U2NhbiwgQ0lEIzE0NzIxMjQgKCJEZXJlZmVyZW5jZSBhZnRlciBu
dWxsIGNoZWNrIikKPgo+IEZpeGVzOiBiZjhkYzU1YjEzNTggKCJ4ZW4vZ250ZGV2OiBJbXBsZW1l
bnQgZG1hLWJ1ZiBpbXBvcnQgZnVuY3Rpb25hbGl0eSIpCj4gU2lnbmVkLW9mZi1ieTogQ29saW4g
SWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBP
c3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKQXBwbGllZCB0byBmb3ItbGlu
dXMtNC4xOS4KCgoKPiAtLS0KPiAgZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5jIHwgMyArKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRldi1kbWFidWYuYyBiL2RyaXZlcnMveGVuL2dudGRl
di1kbWFidWYuYwo+IGluZGV4IDc0NGNmZTliMDMxMS4uY2JhNmI1ODZiZmJkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMveGVuL2dudGRldi1kbWFidWYuYwo+ICsrKyBiL2RyaXZlcnMveGVuL2dudGRl
di1kbWFidWYuYwo+IEBAIC01NjgsNyArNTY4LDcgQEAgc3RhdGljIHN0cnVjdCBnbnRkZXZfZG1h
YnVmICpkbWFidWZfaW1wX2FsbG9jX3N0b3JhZ2UoaW50IGNvdW50KQo+ICAKPiAgCWdudGRldl9k
bWFidWYgPSBremFsbG9jKHNpemVvZigqZ250ZGV2X2RtYWJ1ZiksIEdGUF9LRVJORUwpOwo+ICAJ
aWYgKCFnbnRkZXZfZG1hYnVmKQo+IC0JCWdvdG8gZmFpbDsKPiArCQlnb3RvIGZhaWxfbm9fZnJl
ZTsKPiAgCj4gIAlnbnRkZXZfZG1hYnVmLT51LmltcC5yZWZzID0ga2NhbGxvYyhjb3VudCwKPiAg
CQkJCQkgICAgc2l6ZW9mKGdudGRldl9kbWFidWYtPnUuaW1wLnJlZnNbMF0pLAo+IEBAIC01OTEs
NiArNTkxLDcgQEAgc3RhdGljIHN0cnVjdCBnbnRkZXZfZG1hYnVmICpkbWFidWZfaW1wX2FsbG9j
X3N0b3JhZ2UoaW50IGNvdW50KQo+ICAKPiAgZmFpbDoKPiAgCWRtYWJ1Zl9pbXBfZnJlZV9zdG9y
YWdlKGdudGRldl9kbWFidWYpOwo+ICtmYWlsX25vX2ZyZWU6Cj4gIAlyZXR1cm4gRVJSX1BUUigt
RU5PTUVNKTsKPiAgfQo+ICAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
