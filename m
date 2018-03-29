From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2] xen/acpi: off by one in read_acpi_id()
Date: Thu, 29 Mar 2018 12:01:53 +0300
Message-ID: <20180329090153.GA17927@mwanda>
References: <b8a2f028-8bbe-ae14-41ff-26c99850cba8@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=oxvc=gt=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1f1TRc-00070D-Iw
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 09:02:04 +0000
Content-Disposition: inline
In-Reply-To: <b8a2f028-8bbe-ae14-41ff-26c99850cba8@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Joao Martins <joao.m.martins@oracle.com>, kernel-janitors@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

SWYgYWNwaV9pZCBpcyA9PSBucl9hY3BpX2JpdHMsIHRoZW4gd2UgYWNjZXNzIG9uZSBlbGVtZW50
IGJleW9uZCB0aGUgZW5kCm9mIHRoZSBhY3BpX3BzZFtdIGFycmF5IG9yIHdlIHNldCBvbmUgYml0
IGJleW9uZCB0aGUgZW5kIG9mIHRoZSBiaXQgbWFwCndoZW4gd2UgZG8gX19zZXRfYml0KGFjcGlf
aWQsIGFjcGlfaWRfcHJlc2VudCk7CgpGaXhlczogNTlhNTY4MDI5MTgxICgieGVuL2FjcGktcHJv
Y2Vzc29yOiBDIGFuZCBQLXN0YXRlIGRyaXZlciB0aGF0IHVwbG9hZHMgc2FpZCBkYXRhIHRvIGh5
cGVydmlzb3IuIikKU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBv
cmFjbGUuY29tPgpSZXZpZXdlZC1ieTogSm9hbyBNYXJ0aW5zIDxqb2FvLm0ubWFydGluc0BvcmFj
bGUuY29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jIGIvZHJpdmVycy94ZW4v
eGVuLWFjcGktcHJvY2Vzc29yLmMKaW5kZXggYzgwMTk1ZThmYmQxLi5iMjlmNGU0MDg1MWYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jCisrKyBiL2RyaXZlcnMv
eGVuL3hlbi1hY3BpLXByb2Nlc3Nvci5jCkBAIC0zNjQsOSArMzY0LDkgQEAgcmVhZF9hY3BpX2lk
KGFjcGlfaGFuZGxlIGhhbmRsZSwgdTMyIGx2bCwgdm9pZCAqY29udGV4dCwgdm9pZCAqKnJ2KQog
CX0KIAkvKiBUaGVyZSBhcmUgbW9yZSBBQ1BJIFByb2Nlc3NvciBvYmplY3RzIHRoYW4gaW4geDJB
UElDIG9yIE1BRFQuCiAJICogVGhpcyBjYW4gaGFwcGVuIHdpdGggaW5jb3JyZWN0IEFDUEkgU1NE
VCBkZWNsZXJhdGlvbnMuICovCi0JaWYgKGFjcGlfaWQgPiBucl9hY3BpX2JpdHMpIHsKLQkJcHJf
ZGVidWcoIldlIG9ubHkgaGF2ZSAldSwgdHJ5aW5nIHRvIHNldCAldVxuIiwKLQkJCSBucl9hY3Bp
X2JpdHMsIGFjcGlfaWQpOworCWlmIChhY3BpX2lkID49IG5yX2FjcGlfYml0cykgeworCQlwcl9k
ZWJ1ZygibWF4IGFjcGkgaWQgJXUsIHRyeWluZyB0byBzZXQgJXVcbiIsCisJCQkgbnJfYWNwaV9i
aXRzIC0gMSwgYWNwaV9pZCk7CiAJCXJldHVybiBBRV9PSzsKIAl9CiAJLyogT0ssIFRoZXJlIGlz
IGEgQUNQSSBQcm9jZXNzb3Igb2JqZWN0ICovCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
