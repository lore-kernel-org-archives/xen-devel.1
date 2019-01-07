From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v3 14/15] xsm,
 argo: notify: don't describe rings that cannot be sent to
Date: Sun,  6 Jan 2019 23:42:47 -0800
Message-ID: <1546846968-7372-15-git-send-email-christopher.w.clark@gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x9VP=PP=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ggPZL-0004wm-MR
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 07:43:31 +0000
Received: by mail-pf1-x443.google.com with SMTP id c73so21420151pfe.13
 for <xen-devel@lists.xenproject.org>; Sun, 06 Jan 2019 23:43:30 -0800 (PST)
In-Reply-To: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVz
eXN0ZW1zLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2FyZ28uYyB8IDExICsrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJn
by5jIGIveGVuL2NvbW1vbi9hcmdvLmMKaW5kZXggMzE1MzViZC4uMGRjMDY0ZCAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9hcmdvLmMKKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKQEAgLTExNzIsNiAr
MTE3MiwxNyBAQCBmaWxsX3JpbmdfZGF0YShjb25zdCBzdHJ1Y3QgZG9tYWluICpjdXJyZCwKICAg
ICB7CiAgICAgICAgIGlmICggZHN0X2QtPmFyZ28gKQogICAgICAgICB7CisgICAgICAgICAgICAv
KgorICAgICAgICAgICAgICogRG9uJ3Qgc3VwcGx5IGluZm9ybWF0aW9uIGFib3V0IHJpbmdzIHRo
YXQgYSBndWVzdCBpcyBub3QKKyAgICAgICAgICAgICAqIGFsbG93ZWQgdG8gc2VuZCB0by4KKyAg
ICAgICAgICAgICAqLworICAgICAgICAgICAgcmV0ID0geHNtX2FyZ29fc2VuZChjdXJyZCwgZHN0
X2QpOworICAgICAgICAgICAgaWYgKCByZXQgKQorICAgICAgICAgICAgeworICAgICAgICAgICAg
ICAgIHB1dF9kb21haW4oZHN0X2QpOworICAgICAgICAgICAgICAgIGdvdG8gb3V0OworICAgICAg
ICAgICAgfQorCiAgICAgICAgICAgICByZWFkX2xvY2soJmRzdF9kLT5hcmdvLT5sb2NrKTsKIAog
ICAgICAgICAgICAgcmluZ19pbmZvID0gcmluZ19maW5kX2luZm9fYnlfbWF0Y2goZHN0X2QsIGVu
dC5yaW5nLnBvcnQsCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
