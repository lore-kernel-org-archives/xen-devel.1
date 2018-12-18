From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/netfront: tolerate frags with no data
Date: Tue, 18 Dec 2018 16:06:19 +0100
Message-ID: <20181218150619.6964-1-jgross__26360.1948427551$1545145517$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DuYQ=O3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gZGwy-00066p-2N
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 15:06:24 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org, davem@davemloft.net, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

QXQgbGVhc3Qgb2xkIFhlbiBuZXQgYmFja2VuZHMgc2VlbSB0byBzZW5kIGZyYWdzIHdpdGggbm8g
cmVhbCBkYXRhCnNvbWV0aW1lcy4gSW4gY2FzZSBzdWNoIGEgZnJhZ21lbnQgaGFwcGVucyB0byBv
Y2N1ciB3aXRoIHRoZSBmcmFnIGxpbWl0CmFscmVhZHkgcmVhY2hlZCB0aGUgZnJvbnRlbmQgd2ls
bCBCVUcgY3VycmVudGx5IGV2ZW4gaWYgdGhpcyBzaXR1YXRpb24KaXMgZWFzaWx5IHJlY292ZXJh
YmxlLgoKTW9kaWZ5IHRoZSBCVUdfT04oKSBjb25kaXRpb24gYWNjb3JkaW5nbHkuCgpDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwpUZXN0ZWQtYnk6IERpZXRtYXIgSGFobiA8ZGlldG1hci5oYWhu
QHRzLmZ1aml0c3UuY29tPgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC94ZW4tbmV0ZnJvbnQuYyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCmluZGV4IGYx
N2Y2MDJlNjE3MS4uNWI5N2NjOTQ2ZDcwIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0
ZnJvbnQuYworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYwpAQCAtOTA1LDcgKzkwNSw3
IEBAIHN0YXRpYyBSSU5HX0lEWCB4ZW5uZXRfZmlsbF9mcmFncyhzdHJ1Y3QgbmV0ZnJvbnRfcXVl
dWUgKnF1ZXVlLAogCQlpZiAoc2tiX3NoaW5mbyhza2IpLT5ucl9mcmFncyA9PSBNQVhfU0tCX0ZS
QUdTKSB7CiAJCQl1bnNpZ25lZCBpbnQgcHVsbF90byA9IE5FVEZST05UX1NLQl9DQihza2IpLT5w
dWxsX3RvOwogCi0JCQlCVUdfT04ocHVsbF90byA8PSBza2JfaGVhZGxlbihza2IpKTsKKwkJCUJV
R19PTihwdWxsX3RvIDwgc2tiX2hlYWRsZW4oc2tiKSk7CiAJCQlfX3Bza2JfcHVsbF90YWlsKHNr
YiwgcHVsbF90byAtIHNrYl9oZWFkbGVuKHNrYikpOwogCQl9CiAJCWlmICh1bmxpa2VseShza2Jf
c2hpbmZvKHNrYiktPm5yX2ZyYWdzID49IE1BWF9TS0JfRlJBR1MpKSB7Ci0tIAoyLjE2LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
