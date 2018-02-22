From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] README: require Python 2.6 or newer
Date: Thu, 22 Feb 2018 13:34:58 -0600
Message-ID: <20180222193458.17118-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ke/x=fq=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eowdq-00079Z-Be
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 19:34:54 +0000
Received: by mail-qt0-x242.google.com with SMTP id m13so3025317qtg.13
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2018 11:34:52 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW5jcmVhc2UgdGhlIG1pbmltdW0gcmVxdWlyZWQgUHl0aG9uIHRvIDIuNiBvciBuZXdlci4KClNp
Z25lZC1vZmYtYnk6IERvdWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KLS0tCkNDOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkND
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNDOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpQeXRob24g
Mi42IHNoaXBwZWQgT2N0IDFzdCAyMDA4LiBJdCB3YXMgaW5jbHVkZWQgYXMgdGhlCmRlZmF1bHQg
UHl0aG9uIGluIGRpc3Ryb3MgbGlrZSBSSEVMNiwgd2hpY2ggaXRzZWxmIHNoaXBwZWQKTm92IDEw
dGggMjAxMC4KLS0tCiBSRUFETUUgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9SRUFETUUgYi9SRUFETUUKaW5kZXggZTk2
Y2RkMjg2Mi4uZDUzNmFlMjg1YyAxMDA2NDQKLS0tIGEvUkVBRE1FCisrKyBiL1JFQURNRQpAQCAt
NDYsNyArNDYsNyBAQCBwcm92aWRlZCBieSB5b3VyIE9TIGRpc3RyaWJ1dG9yOgogICAgICAgICAt
IEdDQyA0Ljggb3IgbGF0ZXIKICAgICAgICAgLSBHTlUgQmludXRpbHMgMi4yNCBvciBsYXRlcgog
ICAgICogRGV2ZWxvcG1lbnQgaW5zdGFsbCBvZiB6bGliIChlLmcuLCB6bGliLWRldikKLSAgICAq
IERldmVsb3BtZW50IGluc3RhbGwgb2YgUHl0aG9uIHYyLjMgb3IgbGF0ZXIgKGUuZy4sIHB5dGhv
bi1kZXYpCisgICAgKiBEZXZlbG9wbWVudCBpbnN0YWxsIG9mIFB5dGhvbiB2Mi42IG9yIGxhdGVy
IChlLmcuLCBweXRob24tZGV2KQogICAgICogRGV2ZWxvcG1lbnQgaW5zdGFsbCBvZiBjdXJzZXMg
KGUuZy4sIGxpYm5jdXJzZXMtZGV2KQogICAgICogRGV2ZWxvcG1lbnQgaW5zdGFsbCBvZiBvcGVu
c3NsIChlLmcuLCBvcGVuc3NsLWRldikKICAgICAqIERldmVsb3BtZW50IGluc3RhbGwgb2YgeDEx
IChlLmcuIHhvcmcteDExLWRldikKLS0gCjIuMTMuNgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
