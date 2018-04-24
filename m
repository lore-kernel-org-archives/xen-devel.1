From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 13/16] xen: Expect xenstore write to fail when
 restricted
Date: Tue, 24 Apr 2018 18:58:26 +0100
Message-ID: <1524592709-6553-14-git-send-email-ian.jackson@eu.citrix.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvks=hn=citrix.com=prvs=6454bde7c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fB2D8-0003xq-50
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 17:58:38 +0000
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpTYXZpbmcg
dGhlIGN1cnJlbnQgc3RhdGUgdG8geGVuc3RvcmUgbWF5IGZhaWwgd2hlbiBydW5uaW5nIHJlc3Ry
aWN0ZWQKKGluIHBhcnRpY3VsYXIsIGFmdGVyIGEgbWlncmF0aW9uKS4gVGhlcmVmb3JlLCBkb24n
dCByZXBvcnQgdGhlIGVycm9yIG9yCmV4aXQgd2hlbiBydW5uaW5nIHJlc3RyaWN0ZWQuICBUb29s
c3RhY2tzIHRoYXQgd2FudCB0byBhbGxvdyBydW5uaW5nClFFTVUgcmVzdHJpY3RlZCBzaG91bGQg
aW5zdGVhZCBtYWtlIHVzZSBvZiBRTVAgZXZlbnRzIHRvIGxpc3RlbiBmb3IKc3RhdGUgY2hhbmdl
cy4KCkNDOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KU2lnbmVkLW9m
Zi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+ClJldmlld2Vk
LWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQWNrZWQtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KdjY6IE5ldyBwYXRj
aCBpbiB0aGlzIHZlcnNpb24gb2YgdGhlIHNlcmllcwotLS0KIGh3L3hlbi94ZW4tY29tbW9uLmMg
fCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9ody94ZW4veGVuLWNvbW1vbi5jIGIvaHcveGVuL3hlbi1jb21tb24u
YwppbmRleCA0NTQ3NzdjLi42ZWMxNGM3IDEwMDY0NAotLS0gYS9ody94ZW4veGVuLWNvbW1vbi5j
CisrKyBiL2h3L3hlbi94ZW4tY29tbW9uLmMKQEAgLTEwMSw3ICsxMDEsMTIgQEAgc3RhdGljIHZv
aWQgeGVuc3RvcmVfcmVjb3JkX2RtX3N0YXRlKHN0cnVjdCB4c19oYW5kbGUgKnhzLCBjb25zdCBj
aGFyICpzdGF0ZSkKICAgICB9CiAKICAgICBzbnByaW50ZihwYXRoLCBzaXplb2YgKHBhdGgpLCAi
ZGV2aWNlLW1vZGVsLyV1L3N0YXRlIiwgeGVuX2RvbWlkKTsKLSAgICBpZiAoIXhzX3dyaXRlKHhz
LCBYQlRfTlVMTCwgcGF0aCwgc3RhdGUsIHN0cmxlbihzdGF0ZSkpKSB7CisgICAgLyoKKyAgICAg
KiBUaGlzIGNhbGwgbWF5IGZhaWwgd2hlbiBydW5uaW5nIHJlc3RyaWN0ZWQgc28gZG9uJ3QgbWFr
ZSBpdCBmYXRhbCBpbgorICAgICAqIHRoYXQgY2FzZS4gVG9vbHN0YWNrcyBzaG91bGQgaW5zdGVh
ZCB1c2UgUU1QIHRvIGxpc3RlbiBmb3Igc3RhdGUgY2hhbmdlcy4KKyAgICAgKi8KKyAgICBpZiAo
IXhzX3dyaXRlKHhzLCBYQlRfTlVMTCwgcGF0aCwgc3RhdGUsIHN0cmxlbihzdGF0ZSkpICYmCisg
ICAgICAgICAgICAheGVuX2RvbWlkX3Jlc3RyaWN0KSB7CiAgICAgICAgIGVycm9yX3JlcG9ydCgi
ZXJyb3IgcmVjb3JkaW5nIGRtIHN0YXRlIik7CiAgICAgICAgIGV4aXQoMSk7CiAgICAgfQotLSAK
Mi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
