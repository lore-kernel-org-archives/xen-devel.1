From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] tools/mkrpm: switch payload to gzip to
 reduce turnaround time
Date: Thu, 30 Aug 2018 12:05:11 +0200
Message-ID: <20180830100511.8383-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ntoh=ln=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fvJpG-00021e-BP
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 10:05:18 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>
List-Id: xen-devel@lists.xenproject.org

cnBtYnVpbGQgLWJiIHNwZW50cyBhbG90IG9mIHRpbWUgaW4gY29tcHJlc3NpbmcgdGhlIGJpbmFy
aWVzLiBSZWR1Y2UgdGhlCnR1cm5hcm91bmQgdGltZSBvZiAnbWFrZSBycG1iYWxsJyBieSB1c2lu
ZyBnemlwIGFzIGNvbXByZXNzaW9uIHRvb2wuClRoaXMgcmVkdWNlcyB0aGUgYnVpbGR0aW1lIGZy
b20gJ3c5Lnh6ZGlvJy8xMzggc2Vjb25kcyB0byAndzEuZ3pkaW8nLzg4CnNlY29uZHMgaW4gbXkg
ZW52aXJvbm1lbnQuClRoZSBkb3duc2lkZSBpcyBhbiBpbmNyZWFzZWQgZmlsZXNpemUgb2YgeGVu
LnJwbSwgMTlNQiB2cy4gMzdNQi4KClNpZ25lZC1vZmYtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFl
cGZsZS5kZT4KLS0tCiB0b29scy9taXNjL21rcnBtIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90b29scy9taXNjL21rcnBtIGIvdG9vbHMvbWlzYy9t
a3JwbQppbmRleCBmOTM2M2ExNDU2Li5hZTQwZTFhNGM0IDEwMDY0NAotLS0gYS90b29scy9taXNj
L21rcnBtCisrKyBiL3Rvb2xzL21pc2MvbWtycG0KQEAgLTM3LDYgKzM3LDcgQEAgR3JvdXA6ICAg
U3lzdGVtL0h5cGVydmlzb3IKIFVSTDogaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcveGVu
LmdpdAogCiBCdWlsZFJvb3Q6ICV7X3RtcHBhdGh9LyV7bmFtZX0tJXt2ZXJzaW9ufS0le3JlbGVh
c2V9LXJvb3QKKyVkZWZpbmUgX2JpbmFyeV9wYXlsb2FkIHcxLmd6ZGlvCiAlZGVmaW5lIF9fc3Bl
Y19pbnN0YWxsX3Bvc3QgL3Vzci9saWIvcnBtL2JycC1jb21wcmVzcyB8fCA6CiAlZGVmaW5lIGRl
YnVnX3BhY2thZ2UgJXtuaWx9CiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
