From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 10/10] mfi-common: Fall back to anointed
 builds in Executive mode
Date: Thu, 17 May 2018 12:16:59 +0100
Message-ID: <1526555819-29883-11-git-send-email-ian.jackson@eu.citrix.com>
References: <1526555819-29883-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sats=ie=citrix.com=prvs=668e6091f=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fJGud-0001pk-46
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 11:17:35 +0000
In-Reply-To: <1526555819-29883-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UHJldmlvdXNseSwgYG1ha2UtKi1mbGlnaHQnIHdvdWxkIG5vdCB3b3JrIHVubGVzcyBGUkVFQlNE
XypfQlVJTERKT0IKd2FzIHNldC4gIE5vdyB3ZSB1c2UgdGhlIGFub2ludGVkIHZhbHVlcyBpZiB3
ZSBjYW4gZmluZCB0aGVtLgoKSWYgd2UgY2FuJ3QsIG1nLWFub2ludCByZXRyaWV2ZSB3aWxsIHBy
aW50IGEgd2FybmluZy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBl
dS5jaXRyaXguY29tPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Ci0tLQogbWZpLWNvbW1vbiB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9tZmktY29tbW9uIGIvbWZpLWNvbW1vbgppbmRleCAxN2IxYjUw
Li5mZGRkMWNlIDEwMDY0NAotLS0gYS9tZmktY29tbW9uCisrKyBiL21maS1jb21tb24KQEAgLTEz
MCw2ICsxMzAsOCBAQCBzZXRfZnJlZWJzZF9ydW52YXJzICgpIHsKICAgICAjIDMuIENvbmZpZyBm
aWxlIEZyZWVCU0REaXN0LCBGcmVlQlNEVmVyc2lvbjogc2FtZSBhcyAyLiBleGNlcHQgdGhhdAog
ICAgICMgdGhleSBhcmUgc2V0IG9uIHRoZSBjb25maWcgZmlsZS4KICAgICAjCisgICAgIyA0LiBM
b29rIGZvciBhbiBhbm9pbnRlZCBidWlsZCBvZiBGcmVlQlNEIGBtYXN0ZXInIChFeGVjdXRpdmUg
b25seSkKKyAgICAjCiAgICAgbG9jYWwgZW52dmFyPSJGUkVFQlNEXyR7YXJjaF5efV9CVUlMREpP
QiIKICAgICBpZiBbIC1uICIkeyFlbnZ2YXJ9IiBdOyB0aGVuCiAgICAgICAgIGZyZWVic2RfcnVu
dmFycz0iZnJlZWJzZGJ1aWxkam9iPSR7IWVudnZhcn0iCkBAIC0xNDcsNiArMTQ5LDEyIEBAIHNl
dF9mcmVlYnNkX3J1bnZhcnMgKCkgewogICAgICAgICAgICAgICAgICAgICAgICAgIGZyZWVic2Rf
dmVyc2lvbj0kdmVyc2lvbiIKICAgICAgICAgcmV0dXJuCiAgICAgZmkKKyAgICBsb2NhbCBhbm9p
bnRtZW50PSJmcmVlYnNkIGJ1aWxkIG1hc3RlciAkYXJjaCIKKyAgICBsb2NhbCBmbGlnaHRqb2I9
YC4vbWctYW5vaW50IHJldHJpZXZlIC0tdG9sZXJhdGUtdW5wcmVwYXJlZCAiJGFub2ludG1lbnQi
YAorICAgIGlmIFsgLW4gIiRmbGlnaHRqb2IiIF07IHRoZW4KKyAgICAgICAgZnJlZWJzZF9ydW52
YXJzPSJmcmVlYnNkYnVpbGRqb2I9JHtmbGlnaHRqb2IvIC8ufSIKKyAgICAgICAgcmV0dXJuCisg
ICAgZmkKIH0KIAogY3JlYXRlX2J1aWxkX2pvYnMgKCkgewotLSAKMi4xLjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
