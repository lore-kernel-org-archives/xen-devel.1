From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/3] mfi-common: Drop freebsd builds on
 non-freebsd flights
Date: Wed, 24 Oct 2018 11:32:01 +0100
Message-ID: <20181024103201.18681-3-ian.jackson@eu.citrix.com>
References: <20181024103201.18681-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=maju=ne=citrix.com=prvs=828bad3c7=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gFGSS-0002fC-QT
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 10:32:12 +0000
In-Reply-To: <20181024103201.18681-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U29tZXRoaW5nIGlzIHdyb25nIHdpdGggdGhlIGZyZWVic2QgcmVwb3NpdG9yaWVzLiAgVGhpcyBj
YXVzZXMgZnJlZWJzZApob3N0IGluc3RhbGxhdGlvbiB0byBmYWlsLiAgVGhpcyBwcm9ibGVtIGhh
cyBwZXJzaXN0ZWQgZm9yIGEgd2hpbGUgbm93CmFuZCBpcyBibG9ja2luZyBvdGhlciB3b3JrLgoK
Rm9yIG5vdywgZHJvcCB0aGVzZS4gIFRoZSBqb2JzIGJlaW5nIGRyb3BwZWQgYXJlCiAgICAgIGJ1
aWxkLWFtZDY0LXhlbi1mcmVlYnNkCiAgICAgIGJ1aWxkLWFtZDY0LXhlbi14c20tZnJlZWJzZApp
biB0aGUgYnJhbmNoZXMKICAgICAgb3NzdGVzdAogICAgICB4ZW4tdW5zdGFibGUKKHZlcmlmaWVk
IHdpdGggc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52YXJzKS4KCkNDOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgotLS0KIG1maS1jb21tb24gfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL21maS1jb21tb24gYi9tZmktY29tbW9uCmluZGV4IGFlNmEz
MzdkLi5jMjg2NmU5MyAxMDA2NDQKLS0tIGEvbWZpLWNvbW1vbgorKysgYi9tZmktY29tbW9uCkBA
IC0zMzUsNiArMzM1LDcgQEAgY3JlYXRlX2J1aWxkX2pvYnMgKCkgewogICAgICAgKikgICAgICAg
ICAgICAgICAgYnVpbGRfb25fZnJlZWJzZD10cnVlOzsKICAgICAgIGVzYWM7OwogICAgIGVzYWMK
KyAgICBidWlsZF9vbl9mcmVlYnNkPWZhbHNlCiAKICAgICB3YW50X3ByZXZ4ZW49bgogICAgIGlm
IGJyYW5jaF93YW50c19taWdydXBncmFkZV90ZXN0cyA7IHRoZW4KLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
