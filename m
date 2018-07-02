From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/3] osstest: initial support for building Xen
 on FreeBSD
Date: Mon, 2 Jul 2018 10:40:59 +0200
Message-ID: <20180702084102.90577-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n1b/=js=citrix.com=prvs=714d6e1f6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fZuPH-0007XP-18
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 08:41:59 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIG9zc3Rlc3QgcGF0Y2hlcyBzaG91bGQgYWxsb3cgdG8gYnVp
bGQgWGVuIG9uIEZyZWVCU0QgdXNpbmcKY2xhbmcgYW5kIGxsZCAodGhlIGRlZmF1bHQgdG9vbGNo
YWluIG9uIEZyZWVCU0QpLiBGaXJzdCBwYXRjaCBpcyBhCmNsZWFudXAsIHdoaWxlIHRoZSBsYXN0
IHR3byBwYXRjaGVzIGFkZCB0aGUgYWN0dWFsIEZyZWVCU0Qgc3VwcG9ydC4KCk5vdGUgdGhhdCB0
aGlzIHNlcmllcyBpcyB0aWVkIHRvOiAocmVnYXJkaW5nIHRoZSBTZWFCSU9TIGJ1aWxkCm9wdGlv
bnMpCgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMTgtMDcvbXNnMDAwNDguaHRtbAoKVGhhbmtzLCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAo
Myk6CiAgb3NzdGVzdDogcmVtb3ZlIGR1cGxpY2F0ZSBzZXRfZnJlZWJzZF9ydW52YXJzCiAgb3Nz
dGVzdDogc2V0IHRoZSBtYWtlIGNvbW1hbmQgdG8gdXNlIGZvciB4ZW4tYnVpbGQKICBvc3N0ZXN0
OiBhZGQgRnJlZUJTRCBYZW4gYnVpbGQgam9iCgogbWFrZS1mcmVlYnNkLWZsaWdodCAgIHwgNDgg
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogbWZpLWNvbW1vbiAg
ICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrCiBzZy1ydW4tam9iICAgICAgICAg
ICAgfCAgNiArKysrKysKIHRzLWJ1aWxkLXByZXAtZnJlZWJzZCB8ICA1ICsrKystCiB0cy14ZW4t
YnVpbGQgICAgICAgICAgfCAxMSArKysrKy0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDU2IGluc2Vy
dGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
