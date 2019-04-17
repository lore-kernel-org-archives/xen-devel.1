From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH V4 1/5] xen/arm: Clarify usage of earlyprintk
 for Lager board
Date: Wed, 17 Apr 2019 17:59:31 +0300
Message-ID: <1555513175-7596-2-git-send-email-olekstysh@gmail.com>
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O1DL=ST=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hGm2S-0004XB-9W
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 14:59:52 +0000
Received: by mail-lj1-x241.google.com with SMTP id f18so22748409lja.10
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2019 07:59:51 -0700 (PDT)
In-Reply-To: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKQ3VycmVudCBzZW50ZW5jZSBpcyBub3QgZW50aXJlbHkgY29ycmVjdC4gU2luY2UgU0NJRjAg
aW50ZXJmYWNlIGlzCmFwcGxpY2FibGUgZm9yIExhZ2VyIGJvYXJkLCBidXQgaXMgbm90IGFwcGxp
Y2FibGUgZm9yIGFsbCBSLUNhciBIMgpiYXNlZCBib2FyZHMuIEZvciBleGFtcGxlLCBTdG91dCBi
b2FyZCB1c2VzIFNDSUZBMCBpbnRlcmZhY2UuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlz
aGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+CkFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIGRvY3MvbWlzYy9hcm0vZWFybHktcHJp
bnRrLnR4dCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dCBiL2RvY3Mv
bWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dAppbmRleCBmNzY1ZjU5Li5iMjNjNTRmIDEwMDY0NAot
LS0gYS9kb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQKKysrIGIvZG9jcy9taXNjL2FybS9l
YXJseS1wcmludGsudHh0CkBAIC0zOSw3ICszOSw3IEBAIHRoZSBuYW1lIG9mIHRoZSBtYWNoaW5l
OgogICAtIGZhc3Rtb2RlbDogcHJpbnRrIG9uIEFSTSBGYXN0bW9kZWwgc29mdHdhcmUgZW11bGF0
b3JzCiAgIC0gaGlrZXk5NjA6IHByaW50ayB3aXRoIHBsMDExIHdpdGggSGlrZXkgOTYwCiAgIC0g
anVubzogcHJpbnRrIHdpdGggcGwwMTEgb24gSnVubyBwbGF0Zm9ybQotICAtIGxhZ2VyOiBwcmlu
dGsgd2l0aCBTQ0lGMCBvbiBSZW5lc2FzIFItQ2FyIEgyIHByb2Nlc3NvcnMKKyAgLSBsYWdlcjog
cHJpbnRrIHdpdGggU0NJRjAgb24gUmVuZXNhcyBMYWdlciBib2FyZCAoUi1DYXIgSDIgcHJvY2Vz
c29yKQogICAtIG1pZHdheTogcHJpbnRrIHdpdGggdGhlIHBsMDExIG9uIENhbHhlZGEgTWlkd2F5
IHByb2Nlc3NvcnMKICAgLSBtdmVidTogcHJpbnRrIHdpdGggdGhlIE1WRUJVIGZvciBNYXJ2ZWxs
IEFybWFkYSAzNzAwIFNvQ3MKICAgLSBvbWFwNTQzMjogcHJpbnRrIHdpdGggVUFSVDMgb24gVEkg
T01BUDU0MzIgcHJvY2Vzc29ycwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
