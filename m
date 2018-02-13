From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] pvcalls-front improvements
Date: Mon, 12 Feb 2018 18:13:25 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802121812500.3704__9922.3199220889$1518487957$gmane$org@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0inx=fh=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1elQ6E-00085Q-J6
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 02:13:38 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: boris.ostrovsky@oracle.com, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKdGhpcyBzbWFsbCBzZXJpZXMgaW50cm9kdWNlcyBhIHBlciBzb2NrZXQgcmVmY291
bnQgdG8gaW5jcmVhc2UgdGhlCmVmZmljaWVuY3kgb24gc29ja2V0IHJlbGVhc2Ugb3BlcmF0aW9u
cywgYW5kIG1ha2VzIHJlbGVhc2luZyBwYXNzaXZlCnNvY2tldHMgc2FmZS4KCkNoZWVycywKClN0
ZWZhbm8KCgpDaGFuZ2VzIGluIHYyOgotIGFkZCBhY2tlZC1ieQotIGZpeCBjaGVjayBpbiBwdmNh
bGxzX2VudGVyX3NvYwotIGZpeCBjb2RlIHN0eWxlCi0gbmljZXIgY2hlY2tzIGluIHB2Y2FsbHNf
ZnJvbnRfcmVsZWFzZQoKClN0ZWZhbm8gU3RhYmVsbGluaSAoMik6CiAgICAgIHB2Y2FsbHMtZnJv
bnQ6IGludHJvZHVjZSBhIHBlciBzb2NrX21hcHBpbmcgcmVmY291bnQKICAgICAgcHZjYWxscy1m
cm9udDogd2FpdCBmb3Igb3RoZXIgb3BlcmF0aW9ucyB0byByZXR1cm4gd2hlbiByZWxlYXNlIHBh
c3NpdmUgc29ja2V0cwoKIGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyB8IDE5OSArKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDg3
IGluc2VydGlvbnMoKyksIDExMiBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
