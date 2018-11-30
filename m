From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCHv2 0/2] Fixups for LDT remap placement change
Date: Fri, 30 Nov 2018 23:23:26 +0300
Message-ID: <20181130202328.65359-1-kirill.shutemov__35551.5475770973$1543609412$gmane$org@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o/3g=OJ=linux.intel.com=kirill.shutemov@srs-us1.protection.inumbo.net>)
 id 1gSpLI-0001LX-NE
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 20:24:52 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org
Cc: jgross@suse.com, bhe@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, hans.van.kranenburg@mendix.com, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUncyBhIGNvdXBsZSBmaXhlcyBmb3IgdGhlIHJlY2VudCBMRFQgcmVtYXAgcGxhY2VtZW50
IGNoYW5nZS4KClRoZSBmaXJzdCBwYXRjaCBmaXhlcyBjcmFzaCB3aGVuIGtlcm5lbCBib290ZWQg
YXMgWGVuIGRvbTAuCgpUaGUgc2Vjb25kIHBhdGNoIGZpeGVzIGFkZHJlc3Mgc3BhY2UgbWFya2Vy
cyBpbiBkdW1wX3BhZ2V0YWJsZXMgb3V0cHV0LgpJdCdzIHB1cmVseSBjb3NtZXRpYyBjaGFuZ2Us
IGJhY2twb3J0aW5nIHRvIHRoZSBzdGFibGUgdHJlZSBpcyBvcHRpb25hbC4KCnYyOgogLSBGaXgg
dHlwbwoKS2lyaWxsIEEuIFNodXRlbW92ICgyKToKICB4ODYvbW06IEZpeCBndWFyZCBob2xlIGhh
bmRsaW5nCiAgeDg2L2R1bXBfcGFnZXRhYmxlczogRml4IExEVCByZW1hcCBhZGRyZXNzIG1hcmtl
cgoKIGFyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGVfNjRfdHlwZXMuaCB8ICA1ICsrKysrCiBh
cmNoL3g4Ni9tbS9kdW1wX3BhZ2V0YWJsZXMuYyAgICAgICAgICAgfCAxNSArKysrKystLS0tLS0t
LS0KIGFyY2gveDg2L3hlbi9tbXVfcHYuYyAgICAgICAgICAgICAgICAgICB8IDExICsrKysrKy0t
LS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoK
LS0gCjIuMTkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
