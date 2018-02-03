From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 3/3] x86/svm: correct EFER.SVME intercept
	checks
Date: Sat, 3 Feb 2018 12:03:37 -0500
Message-ID: <3afd1271-ae0c-7d44-0afe-0474c86b568c@oracle.com>
References: <20180131203525.21660-1-brian.woods@amd.com>
 <20180131203525.21660-4-brian.woods@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180131203525.21660-4-brian.woods@amd.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMS8zMS8yMDE4IDAzOjM1IFBNLCBCcmlhbiBXb29kcyB3cm90ZToKPiBDb3JyZWN0cyBz
b21lIEVGRVIuU1ZNRSBjaGVja3MgaW4gaW50ZXJjZXB0cy4gIFNlZSBBTUQgQVBNIHZvbDIgc2Vj
dGlvbgo+IDE1LjQgZm9yIG1vcmUgZGV0YWlscy4gIFZNTUNBTEwgaXNuJ3QgY2hlY2tlZCBkdWUg
dG8gZ3Vlc3RzIG5lZWRpbmcgaXQKPiB0byBib290Lgo+IAoKRG9uJ3QgeW91IG5lZWQgU1ZNRSBi
ZSBvbiBmb3IgVk1NQ0FMTD8KCi1ib3JpcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
