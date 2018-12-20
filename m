From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v2 07/18] errno: add POSIX error codes EMSGSIZE,
 ECONNREFUSED to the ABI
Date: Wed, 19 Dec 2018 22:39:04 -0800
Message-ID: <1545287955-27684-8-git-send-email-christopher.w.clark@gmail.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZmS=O5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gZrzo-0005vG-TO
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 06:39:48 +0000
Received: by mail-io1-xd43.google.com with SMTP id r200so467020iod.11
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 22:39:48 -0800 (PST)
In-Reply-To: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
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
IDogIkNvbm5lY3Rpb24gcmVmdXNlZCIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFy
ayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMuY29tPgotLS0KIHhlbi9pbmNsdWRlL3B1
YmxpYy9lcnJuby5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9lcnJuby5oIGIveGVuL2luY2x1ZGUvcHVibGlj
L2Vycm5vLmgKaW5kZXggMzA1YzExMi4uZTFkMDJmYyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL2Vycm5vLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2Vycm5vLmgKQEAgLTEwMiw2
ICsxMDIsNyBAQCBYRU5fRVJSTk8oRUlMU0VRLAk4NCkJLyogSWxsZWdhbCBieXRlIHNlcXVlbmNl
ICovCiBYRU5fRVJSTk8oRVJFU1RBUlQsCTg1KQkvKiBJbnRlcnJ1cHRlZCBzeXN0ZW0gY2FsbCBz
aG91bGQgYmUgcmVzdGFydGVkICovCiAjZW5kaWYKIFhFTl9FUlJOTyhFTk9UU09DSywJODgpCS8q
IFNvY2tldCBvcGVyYXRpb24gb24gbm9uLXNvY2tldCAqLworWEVOX0VSUk5PKEVNU0dTSVpFLAk5
MCkJLyogTWVzc2FnZSB0b28gbGFyZ2UuICovCiBYRU5fRVJSTk8oRU9QTk9UU1VQUCwJOTUpCS8q
IE9wZXJhdGlvbiBub3Qgc3VwcG9ydGVkIG9uIHRyYW5zcG9ydCBlbmRwb2ludCAqLwogWEVOX0VS
Uk5PKEVBRERSSU5VU0UsCTk4KQkvKiBBZGRyZXNzIGFscmVhZHkgaW4gdXNlICovCiBYRU5fRVJS
Tk8oRUFERFJOT1RBVkFJTCwgOTkpCS8qIENhbm5vdCBhc3NpZ24gcmVxdWVzdGVkIGFkZHJlc3Mg
Ki8KQEAgLTEwOSw2ICsxMTAsNyBAQCBYRU5fRVJSTk8oRU5PQlVGUywJMTA1KQkvKiBObyBidWZm
ZXIgc3BhY2UgYXZhaWxhYmxlICovCiBYRU5fRVJSTk8oRUlTQ09OTiwJMTA2KQkvKiBUcmFuc3Bv
cnQgZW5kcG9pbnQgaXMgYWxyZWFkeSBjb25uZWN0ZWQgKi8KIFhFTl9FUlJOTyhFTk9UQ09OTiwJ
MTA3KQkvKiBUcmFuc3BvcnQgZW5kcG9pbnQgaXMgbm90IGNvbm5lY3RlZCAqLwogWEVOX0VSUk5P
KEVUSU1FRE9VVCwJMTEwKQkvKiBDb25uZWN0aW9uIHRpbWVkIG91dCAqLworWEVOX0VSUk5PKEVD
T05OUkVGVVNFRCwJMTExKQkvKiBDb25uZWN0aW9uIHJlZnVzZWQgKi8KIAogI3VuZGVmIFhFTl9F
UlJOTwogI2VuZGlmIC8qIFhFTl9FUlJOTyAqLwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
