From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH V2 2/3] xen/arm: Clarify usage of earlyprintk
 for Lager board
Date: Fri,  1 Feb 2019 14:37:31 +0200
Message-ID: <1549024652-24805-3-git-send-email-olekstysh@gmail.com>
References: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SaHb=QI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1gpY4n-0003AA-Sw
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 12:37:45 +0000
Received: by mail-lj1-x241.google.com with SMTP id k19-v6so5624328lji.11
 for <xen-devel@lists.xenproject.org>; Fri, 01 Feb 2019 04:37:44 -0800 (PST)
In-Reply-To: <1549024652-24805-1-git-send-email-olekstysh@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKQ3VycmVudCBzZW50ZW5jZSBpcyBub3QgZW50aXJlbHkgY29ycmVjdC4gU2luY2UgU0NJRjAg
aW50ZXJmYWNlIGlzCmFwcGxpY2FibGUgZm9yIExhZ2VyIGJvYXJkLCBidXQgaXMgbm90IGFwcGxp
Y2FibGUgZm9yIGFsbCBSLUNhciBIMgpiYXNlZCBib2FyZHMuIEZvciBleGFtcGxlLCBTdG91dCBi
b2FyZCB1c2VzIFNDSUZBMCBpbnRlcmZhY2UuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlz
aGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Ci0tLQogZG9jcy9taXNjL2Fy
bS9lYXJseS1wcmludGsudHh0IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsu
dHh0IGIvZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsudHh0CmluZGV4IGY3NjVmNTkuLmIyM2M1
NGYgMTAwNjQ0Ci0tLSBhL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dAorKysgYi9kb2Nz
L21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQKQEAgLTM5LDcgKzM5LDcgQEAgdGhlIG5hbWUgb2Yg
dGhlIG1hY2hpbmU6CiAgIC0gZmFzdG1vZGVsOiBwcmludGsgb24gQVJNIEZhc3Rtb2RlbCBzb2Z0
d2FyZSBlbXVsYXRvcnMKICAgLSBoaWtleTk2MDogcHJpbnRrIHdpdGggcGwwMTEgd2l0aCBIaWtl
eSA5NjAKICAgLSBqdW5vOiBwcmludGsgd2l0aCBwbDAxMSBvbiBKdW5vIHBsYXRmb3JtCi0gIC0g
bGFnZXI6IHByaW50ayB3aXRoIFNDSUYwIG9uIFJlbmVzYXMgUi1DYXIgSDIgcHJvY2Vzc29ycwor
ICAtIGxhZ2VyOiBwcmludGsgd2l0aCBTQ0lGMCBvbiBSZW5lc2FzIExhZ2VyIGJvYXJkIChSLUNh
ciBIMiBwcm9jZXNzb3IpCiAgIC0gbWlkd2F5OiBwcmludGsgd2l0aCB0aGUgcGwwMTEgb24gQ2Fs
eGVkYSBNaWR3YXkgcHJvY2Vzc29ycwogICAtIG12ZWJ1OiBwcmludGsgd2l0aCB0aGUgTVZFQlUg
Zm9yIE1hcnZlbGwgQXJtYWRhIDM3MDAgU29DcwogICAtIG9tYXA1NDMyOiBwcmludGsgd2l0aCBV
QVJUMyBvbiBUSSBPTUFQNTQzMiBwcm9jZXNzb3JzCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
