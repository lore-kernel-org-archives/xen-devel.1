From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v6 14/15] xsm,
 argo: notify: don't describe rings that cannot be sent to
Date: Wed, 23 Jan 2019 18:05:02 -0800
Message-ID: <1548295503-15946-15-git-send-email-christopher.w.clark@gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ulBm=QA=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gmUOy-0004JZ-C8
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 02:05:56 +0000
Received: by mail-io1-xd42.google.com with SMTP id k2so3365789iog.7
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 18:05:55 -0800 (PST)
In-Reply-To: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVz
eXN0ZW1zLmNvbT4KQWNrZWQtYnk6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2Eu
Z292PgoKdjMgIzEwIFJvZ2VyOiBkcm9wIG91dCBsYWJlbCwgdXNlIHJldHVybiAtRUZBVUxUIGlu
IGZpbGxfcmluZ19kYXRhCnYzOiBBZGQgRGFuaWVsJ3MgQWNrZWQtYnkKLS0tCiB4ZW4vY29tbW9u
L2FyZ28uYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJnby5jIGIveGVuL2NvbW1vbi9hcmdvLmMKaW5k
ZXggYmE5YzFkNi4uYzdiMDkxYiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9hcmdvLmMKKysrIGIv
eGVuL2NvbW1vbi9hcmdvLmMKQEAgLTEzNzEsNiArMTM3MSwxNyBAQCBmaWxsX3JpbmdfZGF0YShj
b25zdCBzdHJ1Y3QgZG9tYWluICpjdXJyZCwKICAgICBpZiAoICFkc3RfZCB8fCAhZHN0X2QtPmFy
Z28gKQogICAgICAgICBnb3RvIG91dDsKIAorICAgIC8qCisgICAgICogRG9uJ3Qgc3VwcGx5IGlu
Zm9ybWF0aW9uIGFib3V0IHJpbmdzIHRoYXQgYSBndWVzdCBpcyBub3QKKyAgICAgKiBhbGxvd2Vk
IHRvIHNlbmQgdG8uCisgICAgICovCisgICAgcmV0ID0geHNtX2FyZ29fc2VuZChjdXJyZCwgZHN0
X2QpOworICAgIGlmICggcmV0ICkKKyAgICB7CisgICAgICAgIHB1dF9kb21haW4oZHN0X2QpOwor
ICAgICAgICByZXR1cm4gcmV0OworICAgIH0KKwogICAgIHJlYWRfbG9jaygmZHN0X2QtPmFyZ28t
PnJpbmdzX0wyX3J3bG9jayk7CiAKICAgICByaW5nX2luZm8gPSBmaW5kX3JpbmdfaW5mb19ieV9t
YXRjaChkc3RfZCwgZW50LnJpbmcuYXBvcnQsCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
