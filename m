From: Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V4 5/5] xen/arm: Add early printk support
 for SCIFA compatible UARTs
Date: Tue, 30 Apr 2019 14:04:21 +0300
Message-ID: <864da0bc-0c5d-9ef8-f0dc-02d89dd34cab@gmail.com>
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
 <1555513175-7596-6-git-send-email-olekstysh@gmail.com>
 <c7ac1368-a3cc-0eb2-76ca-195665db5fff@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SUxV=TA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hLQYj-0006KS-Mv
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 11:04:25 +0000
Received: by mail-lf1-x142.google.com with SMTP id t30so10380377lfd.8
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2019 04:04:24 -0700 (PDT)
In-Reply-To: <c7ac1368-a3cc-0eb2-76ca-195665db5fff@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

Ck9uIDI5LjA0LjE5IDE3OjMwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGksIEp1bGllbgoKCj4+IEBAIC0yMiwxMCArMjIsMTMgQEAKPj4gwqAgI2lmZGVmIEVBUkxZX1BS
SU5US19WRVJTSU9OX05PTkUKPj4gwqAgI2RlZmluZSBTVEFUVVNfUkVHwqDCoMKgIFNDSUZfU0NG
U1IKPj4gwqAgI2RlZmluZSBUWF9GSUZPX1JFR8KgwqAgU0NJRl9TQ0ZURFIKPj4gKyNlbGlmIEVB
UkxZX1BSSU5US19WRVJTSU9OX0EKPj4gKyNkZWZpbmUgU1RBVFVTX1JFR8KgwqDCoCBTQ0lGQV9T
Q0FTU1IKPj4gKyNkZWZpbmUgVFhfRklGT19SRUfCoMKgIFNDSUZBX1NDQUZURFIKPj4gwqAgI2Vu
ZGlmCj4+IMKgIMKgIC8qCj4+IC0gKiBTQ0lGIFVBUlQgd2FpdCBVQVJUIHRvIGJlIHJlYWR5IHRv
IHRyYW5zbWl0Cj4+ICsgKiBXYWl0IFVBUlQgdG8gYmUgcmVhZHkgdG8gdHJhbnNtaXQKPgo+IFRo
aXMgY2hhbmdlIGFuZCAuLi4KPgo+PiDCoMKgICogcmI6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5z
IHRoZSBVQVJUIGJhc2UgYWRkcmVzcwo+PiDCoMKgICogcmM6IHNjcmF0Y2ggcmVnaXN0ZXIKPj4g
wqDCoCAqLwo+PiBAQCAtMzcsNyArNDAsNyBAQAo+PiDCoCAuZW5kbQo+PiDCoCDCoCAvKgo+PiAt
ICogU0NJRiBVQVJUIHRyYW5zbWl0IGNoYXJhY3Rlcgo+PiArICogVUFSVCB0cmFuc21pdCBjaGFy
YWN0ZXIKPgo+IC4uLiB0aGlzIG9uZSBsb29rIGxpa2UgbW9yZSBhIGNoYW5nZSBmb3IgdGhlIHBy
ZXZpb3VzIHRoYW4gdGhpcyBvbmUuCgphZ3JlZSwgd2lsbCBtb3ZlIHRvIHByZXZpb3VzIHBhdGNo
LgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
