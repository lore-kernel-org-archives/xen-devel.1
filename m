From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/2] x86: cater for CPUID leaf 7 subleaf 1
Date: Fri, 17 May 2019 06:21:01 -0600
Message-ID: <5CDEA72D020000780023015E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRbrF-0006S3-R3
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 12:21:05 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgSSd2ZSBhbHNvIGFscmVhZHkgY29kZWQgdXAgdGhlIHBhdGNoIHRvIGFjdHVhbGx5IHN1
cHBvcnQKdGhlIG5ldyBCRmxvYXQxNiBpbnNucywgdGhlcmUncyBsaXR0bGUgcG9pbnQgaW4gc3Vi
bWl0dGluZyB0aGlzCndpdGhvdXQgaGF2aW5nIHRlc3RlZCBpdC4gQnV0IHRoZSB0d28gcHJlcGFy
YXRvcnkgcGF0Y2hlcyBtYXkKdHVybiBvdXQgdXNlZnVsIGVhcmxpZXIgb24uIFRoZXkncmUgYmFz
ZWQgb24gdGhlIGZ1bGwgQVZYNTEyCmVtdWxhdG9yIHNlcmllcywgYnV0IHNob3VsZG4ndCBiZSBv
dmVybHkgZGlmZmljdWx0IHRvIHJlLWJhc2UKYWhlYWQgb2YgaXQuCgoxOiB4ODYvQ1BVSUQ6IHN1
cHBvcnQgbGVhZiA3IHN1YmxlYWYgMSAvIEFWWDUxMl9CRjE2CjI6IHg4NmVtdWw6IHN1cHBvcnQg
Q1BVSUQgc3VibGVhdmVzIGZvciB2Y3B1X2hhc18qKCkKCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
