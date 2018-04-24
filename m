From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 16/16] configure: do_compiler: Dump some extra
 info under bash
Date: Tue, 24 Apr 2018 18:58:29 +0100
Message-ID: <1524592709-6553-17-git-send-email-ian.jackson@eu.citrix.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvks=hn=citrix.com=prvs=6454bde7c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fB2DN-000431-I5
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 17:58:53 +0000
In-Reply-To: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Janosch Frank <frankja@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, "Kent R. Spillner" <kspillner@acm.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhpcyBtYWtlcyBpdCBtdWNoIGVhc2llciB0byBmaW5kIGEgcGFydGljdWxhciB0aGluZyBpbiBj
b25maWcubG9nLgoKV2UgaGF2ZSB0byB1c2UgdGhlICR7QkFTSF9MSU5FTk9bKl19IHN5bnRheCB3
aGljaCBpcyBhIHN5bnRheCBlcnJvciBpbgpvdGhlciBzaGVsbHMsIHNvIHRlc3Qgd2hhdCBzaGVs
bCB3ZSBhcmUgcnVubmluZyBhbmQgdXNlIGV2YWwuCgpUaGUgZXh0cmEgb3V0cHV0IGlzIG9ubHkg
cHJpbnRlZCBpZiBjb25maWd1cmUgaXMgcnVuIHdpdGggYmFzaC4gIE9uCnN5c3RlbXMgd2hlcmUg
L2Jpbi9zaCBpcyBub3QgYmFzaCwgaXQgaXMgbmVjZXNzYXJ5IHRvIHNheSBiYXNoCi4vY29uZmln
dXJlIHRvIGdldCB0aGUgZXh0cmEgZGVidWcgaW5mbyBpbiB0aGUgbG9nLgoKU3VnZ2VzdGVkLWJ5
OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogSWFuIEphY2tz
b24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+CkNDOiBLZW50IFIuIFNwaWxsbmVyIDxrc3Bp
bGxuZXJAYWNtLm9yZz4KQ0M6IEphbm9zY2ggRnJhbmsgPGZyYW5ramFAbGludXgudm5ldC5pYm0u
Y29tPgpDQzogVGhvbWFzIEh1dGggPHRodXRoQHJlZGhhdC5jb20+CkNDOiBQZXRlciBNYXlkZWxs
IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+CkNDOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUBy
ZWRoYXQuY29tPgotLS0Kdjg6IEZpeCBzbyB0aGF0IGl0IGFjdHVhbGx5IHdvcmtzIGFzIGludGVu
ZGVkIHdpdGggYmFzaC4KdjY6IEZpeCBjb21taXQgbWVzc2FnZSB3b3JkaW5nLgp2NDogTm8gbG9u
Z2VyIHRhZyB0aGlzIHBhdGNoIFJGQy4KLS0tCiBjb25maWd1cmUgfCA1ICsrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmln
dXJlCmluZGV4IGFhMzVhZWYuLmY5YmE5ZWEgMTAwNzU1Ci0tLSBhL2NvbmZpZ3VyZQorKysgYi9j
b25maWd1cmUKQEAgLTYwLDYgKzYwLDExIEBAIGRvX2NvbXBpbGVyKCkgewogICAgICMgaXMgY29t
cGlsZXIgYmluYXJ5IHRvIGV4ZWN1dGUuCiAgICAgbG9jYWwgY29tcGlsZXI9IiQxIgogICAgIHNo
aWZ0CisgICAgaWYgdGVzdCAtbiAiJEJBU0hfVkVSU0lPTiI7IHRoZW4gZXZhbCAnCisgICAgICAg
IGVjaG8gPj5jb25maWcubG9nICIKK2Z1bmNzOiAke0ZVTkNOQU1FWypdfQorbGluZXM6ICR7QkFT
SF9MSU5FTk9bKl19IgorICAgICc7IGZpCiAgICAgZWNobyAkY29tcGlsZXIgIiRAIiA+PiBjb25m
aWcubG9nCiAgICAgJGNvbXBpbGVyICIkQCIgPj4gY29uZmlnLmxvZyAyPiYxIHx8IHJldHVybiAk
PwogICAgICMgVGVzdCBwYXNzZWQuIElmIHRoaXMgaXMgYW4gLS1lbmFibGUtd2Vycm9yIGJ1aWxk
LCByZXJ1bgotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
