From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 20/25] argo,
 xsm: notify: don't describe rings that cannot be sent to
Date: Fri, 30 Nov 2018 17:32:59 -0800
Message-ID: <1543627984-21394-21-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSuAc-0007Bc-EL
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:34:10 +0000
Received: by mail-it1-x142.google.com with SMTP id i7so1401569iti.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:34:09 -0800 (PST)
In-Reply-To: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVz
eXN0ZW1zLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2FyZ28uYyB8IDExICsrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJn
by5jIGIveGVuL2NvbW1vbi9hcmdvLmMKaW5kZXggMDg1OGZiMi4uMzk3NzhmZCAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9hcmdvLmMKKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKQEAgLTg0NSw2ICs4
NDUsMTcgQEAgYXJnb19maWxsX3JpbmdfZGF0YShzdHJ1Y3QgZG9tYWluICpzcmNfZCwKIAogICAg
IGlmICggZHN0X2QgJiYgZHN0X2QtPmFyZ28gKQogICAgIHsKKyAgICAgICAgLyoKKyAgICAgICAg
ICogRG9uJ3Qgc3VwcGx5IGluZm9ybWF0aW9uIGFib3V0IHJpbmdzIHRoYXQgYSBndWVzdCBpcyBu
b3QKKyAgICAgICAgICogYWxsb3dlZCB0byBzZW5kIHRvLgorICAgICAgICAgKi8KKyAgICAgICAg
cmV0ID0geHNtX2FyZ29fc2VuZChzcmNfZCwgZHN0X2QpOworICAgICAgICBpZiAoIHJldCApCisg
ICAgICAgIHsKKyAgICAgICAgICAgIHB1dF9kb21haW4oZHN0X2QpOworICAgICAgICAgICAgcmV0
dXJuIHJldDsKKyAgICAgICAgfQorCiAgICAgICAgIHJlYWRfbG9jaygmZHN0X2QtPmFyZ28tPmxv
Y2spOwogCiAgICAgICAgIHJpbmdfaW5mbyA9IGFyZ29fcmluZ19maW5kX2luZm9fYnlfbWF0Y2go
ZHN0X2QsIGVudC5yaW5nLnBvcnQsIHNyY19pZCwKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
