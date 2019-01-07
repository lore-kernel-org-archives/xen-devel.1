From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v3 05/15] errno: add POSIX error codes EMSGSIZE,
 ECONNREFUSED to the ABI
Date: Sun,  6 Jan 2019 23:42:38 -0800
Message-ID: <1546846968-7372-6-git-send-email-christopher.w.clark@gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x9VP=PP=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ggPZ5-0004ej-4H
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 07:43:15 +0000
Received: by mail-pf1-x442.google.com with SMTP id g62so21425730pfd.12
 for <xen-devel@lists.xenproject.org>; Sun, 06 Jan 2019 23:43:14 -0800 (PST)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RU1TR1NJWkU6IEFyZ28ncyBzZW5kdiBvcGVyYXRpb24gd2lsbCByZXR1cm4gRU1TR1NJWkUgd2hl
biBhbiBleGNlc3MgYW1vdW50Cm9mIGRhdGEsIGFjcm9zcyBhbGwgaW92cywgaGFzIGJlZW4gc3Vw
cGxpZWQsIGV4Y2VlZGluZyBlaXRoZXIgdGhlIHN0YXRpY2FsbHkKY29uZmlndXJlZCBtYXhpbXVt
IHNpemUgb2YgYSB0cmFuc21pdHRhYmxlIG1lc3NhZ2UsIG9yIHRoZSAodmFyaWFibGUpIHNpemUK
b2YgdGhlIHJpbmcgcmVnaXN0ZXJlZCBieSB0aGUgZGVzdGluYXRpb24gZG9tYWluLgoKRUNPTk5S
RUZVU0VEOiBBcmdvJ3MgcmVnaXN0ZXIgb3BlcmF0aW9uIHdpbGwgcmV0dXJuIEVDT05OUkVGVVNF
RCBpZiBhIHJpbmcKaXMgYmVpbmcgcmVnaXN0ZXJlZCB0byBjb21tdW5pY2F0ZSB3aXRoIGEgc3Bl
Y2lmaWMgcmVtb3RlIGRvbWFpbiB0aGF0IGRvZXMKZXhpc3QgYnV0IGlzIG5vdCBhcmdvLWVuYWJs
ZWQuCgpUaGVzZSBjb2RlcyBhcmUgZGVzY3JpYmVkIGJ5IFBPU0lYIGhlcmU6Cmh0dHA6Ly9wdWJz
Lm9wZW5ncm91cC5vcmcvb25saW5lcHVicy85Njk5OTE5Nzk5L2Jhc2VkZWZzL2Vycm5vLmguaHRt
bAogICAgRU1TR1NJWkUgICAgIDogIk1lc3NhZ2UgdG9vIGxhcmdlIgogICAgRUNPTk5SRUZVU0VE
IDogIkNvbm5lY3Rpb24gcmVmdXNlZCIuCgpUaGUgbnVtZXJpYyB2YWx1ZXMgYXNzaWduZWQgdG8g
ZWFjaCBhcmUgdGFrZW4gZnJvbSBMaW51eCwgYXMgaXMgdGhlIGNhc2UKZm9yIHRoZSBleGlzdGlu
ZyBlcnJvciBjb2Rlcy4KICAgIEVNU0dTSVpFICAgICA6IDkwCiAgICBFQ09OTlJFRlVTRUQgOiAx
MTEKClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFyazZA
YmFlc3lzdGVtcy5jb20+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Ci0tLQogeGVuL2luY2x1ZGUvcHVibGljL2Vycm5vLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2Vycm5vLmgg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvZXJybm8uaAppbmRleCAzMDVjMTEyLi5lMWQwMmZjIDEwMDY0
NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZXJybm8uaAorKysgYi94ZW4vaW5jbHVkZS9wdWJs
aWMvZXJybm8uaApAQCAtMTAyLDYgKzEwMiw3IEBAIFhFTl9FUlJOTyhFSUxTRVEsCTg0KQkvKiBJ
bGxlZ2FsIGJ5dGUgc2VxdWVuY2UgKi8KIFhFTl9FUlJOTyhFUkVTVEFSVCwJODUpCS8qIEludGVy
cnVwdGVkIHN5c3RlbSBjYWxsIHNob3VsZCBiZSByZXN0YXJ0ZWQgKi8KICNlbmRpZgogWEVOX0VS
Uk5PKEVOT1RTT0NLLAk4OCkJLyogU29ja2V0IG9wZXJhdGlvbiBvbiBub24tc29ja2V0ICovCitY
RU5fRVJSTk8oRU1TR1NJWkUsCTkwKQkvKiBNZXNzYWdlIHRvbyBsYXJnZS4gKi8KIFhFTl9FUlJO
TyhFT1BOT1RTVVBQLAk5NSkJLyogT3BlcmF0aW9uIG5vdCBzdXBwb3J0ZWQgb24gdHJhbnNwb3J0
IGVuZHBvaW50ICovCiBYRU5fRVJSTk8oRUFERFJJTlVTRSwJOTgpCS8qIEFkZHJlc3MgYWxyZWFk
eSBpbiB1c2UgKi8KIFhFTl9FUlJOTyhFQUREUk5PVEFWQUlMLCA5OSkJLyogQ2Fubm90IGFzc2ln
biByZXF1ZXN0ZWQgYWRkcmVzcyAqLwpAQCAtMTA5LDYgKzExMCw3IEBAIFhFTl9FUlJOTyhFTk9C
VUZTLAkxMDUpCS8qIE5vIGJ1ZmZlciBzcGFjZSBhdmFpbGFibGUgKi8KIFhFTl9FUlJOTyhFSVND
T05OLAkxMDYpCS8qIFRyYW5zcG9ydCBlbmRwb2ludCBpcyBhbHJlYWR5IGNvbm5lY3RlZCAqLwog
WEVOX0VSUk5PKEVOT1RDT05OLAkxMDcpCS8qIFRyYW5zcG9ydCBlbmRwb2ludCBpcyBub3QgY29u
bmVjdGVkICovCiBYRU5fRVJSTk8oRVRJTUVET1VULAkxMTApCS8qIENvbm5lY3Rpb24gdGltZWQg
b3V0ICovCitYRU5fRVJSTk8oRUNPTk5SRUZVU0VELAkxMTEpCS8qIENvbm5lY3Rpb24gcmVmdXNl
ZCAqLwogCiAjdW5kZWYgWEVOX0VSUk5PCiAjZW5kaWYgLyogWEVOX0VSUk5PICovCi0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
