From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v9 05/11] x86/hvm: Permit guests direct
 access to MSR_{SPEC_CTRL, PRED_CMD}
Date: Fri, 19 Jan 2018 10:54:21 +0000
Message-ID: <aab67c00-7df1-b6f0-c905-a2b85d98c6e3@citrix.com>
References: <1516290370-14958-1-git-send-email-andrew.cooper3@citrix.com>
 <1516290370-14958-6-git-send-email-andrew.cooper3@citrix.com>
 <5A61DC1702000078001A04A1@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A61DC1702000078001A04A1@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDEvMTggMTA6NTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjAxLjE4IGF0
IDE2OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEBAIC0yOTIsNiAr
MzAxLDE2IEBAIHN0YXRpYyBpbnQgdXBkYXRlX2RvbWFpbl9jcHVpZF9pbmZvKHN0cnVjdCBkb21h
aW4gKmQsCj4+ICAgICAgICAgICAgICBkLT5hcmNoLnB2X2RvbWFpbi5jcHVpZG1hc2tzLT5lMWNk
ID0gbWFzazsKPj4gICAgICAgICAgfQo+PiAgICAgICAgICBicmVhazsKPj4gKwo+PiArICAgIGNh
c2UgMHg4MDAwMDAwODoKPj4gKyAgICAgICAgLyoKPj4gKyAgICAgICAgICogSWYgdGhlIElCUkIg
cG9saWN5IGhhcyBjaGFuZ2VkLCB3ZSBuZWVkIHRvIHJlY2FsY3VsYXRlIHRoZSBNU1IKPiAiSUJQ
QiIgSSB0aGluaz8gT3RoZXIgdGhhbiB0aGF0Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkluZGVlZC7CoCBTb3JyeS7CoCAoSSdtIGdvaW5nIHRvIGdyZXAg
YWNyb3NzIHRoZSBjb2RlYmFzZSBmb3IgYW55IG90aGVyCm1pc3Rha2VzIGJlZm9yZSBjb21taXR0
aW5nLCBiZWNhdXNlIEkgZG91YnQgdGhpcyBpcyB0aGUgb25seSBleGFtcGxlKS4KCn5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
