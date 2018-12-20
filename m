From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v2 16/18] xsm,
 argo: notify: don't describe rings that cannot be sent to
Date: Wed, 19 Dec 2018 22:39:13 -0800
Message-ID: <1545287955-27684-17-git-send-email-christopher.w.clark@gmail.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZmS=O5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gZs09-0006n3-Nj
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 06:40:09 +0000
Received: by mail-io1-xd41.google.com with SMTP id m19so494137ioh.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 22:40:08 -0800 (PST)
In-Reply-To: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVz
eXN0ZW1zLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2FyZ28uYyB8IDExICsrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJn
by5jIGIveGVuL2NvbW1vbi9hcmdvLmMKaW5kZXggMWYxNjg3Mi4uOTIxYWFmMyAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9hcmdvLmMKKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKQEAgLTExMTUsNiAr
MTExNSwxNyBAQCBhcmdvX2ZpbGxfcmluZ19kYXRhKGNvbnN0IHN0cnVjdCBkb21haW4gKnNyY19k
LAogCiAgICAgaWYgKCBkc3RfZCAmJiBkc3RfZC0+YXJnbyApCiAgICAgeworICAgICAgICAvKgor
ICAgICAgICAgKiBEb24ndCBzdXBwbHkgaW5mb3JtYXRpb24gYWJvdXQgcmluZ3MgdGhhdCBhIGd1
ZXN0IGlzIG5vdAorICAgICAgICAgKiBhbGxvd2VkIHRvIHNlbmQgdG8uCisgICAgICAgICAqLwor
ICAgICAgICByZXQgPSB4c21fYXJnb19zZW5kKHNyY19kLCBkc3RfZCk7CisgICAgICAgIGlmICgg
cmV0ICkKKyAgICAgICAgeworICAgICAgICAgICAgcHV0X2RvbWFpbihkc3RfZCk7CisgICAgICAg
ICAgICByZXR1cm4gcmV0OworICAgICAgICB9CisKICAgICAgICAgcmVhZF9sb2NrKCZkc3RfZC0+
YXJnby0+bG9jayk7CiAKICAgICAgICAgcmluZ19pbmZvID0gYXJnb19yaW5nX2ZpbmRfaW5mb19i
eV9tYXRjaChkc3RfZCwgZW50LnJpbmcucG9ydCwgc3JjX2lkLAotLSAKMi43LjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
