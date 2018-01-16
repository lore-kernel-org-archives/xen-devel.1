From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH RFC 01/44] passthrough/vtd: Don't DMA to the
 stack in queue_invalidate_wait()
Date: Tue, 16 Jan 2018 06:41:00 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D190ECEC1C@SHSMSX101.ccr.corp.intel.com>
References: <1515097329-31902-1-git-send-email-andrew.cooper3@citrix.com>
 <1515097329-31902-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515097329-31902-2-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0K
PiBTZW50OiBGcmlkYXksIEphbnVhcnkgNSwgMjAxOCA0OjIxIEFNCj4gCj4gRE1BLWluZyB0byB0
aGUgc3RhY2sgaXMgZ2VuZXJhbGx5IGNvbnNpZGVyZWQgYmFkIHByYWN0aWNlLiAgSW4gdGhpcyBj
YXNlLCBpZiBhCj4gdGltZW91dCBvY2N1cnMgYmVjYXVzZSBvZiBhIHNsdWdnaXNoIGRldmljZSB3
aGljaCBpcyBwcm9jZXNzaW5nIHRoZSByZXF1ZXN0LAo+IHRoZSBjb21wbGV0aW9uIG5vdGlmaWNh
dGlvbiB3aWxsIGNvcnJ1cHQgdGhlIHN0YWNrIG9mIGEgc3Vic2VxdWVudCBkZWVwZXIKPiBjYWxs
Cj4gdHJlZS4KPiAKPiBQbGFjZSB0aGUgcG9sbF9zbG90IGluIGEgcGVyY3B1IGFyZWEgYW5kIERN
QSB0byB0aGF0IGluc3RlYWQuCj4gCj4gTm90ZTogVGhpcyBjaGFuZ2UgZG9lcyBub3QgYWRkcmVz
cyBvdGhlciBpc3N1ZXMgd2l0aCB0aGUgY3VycmVudAo+IGltcGxlbWVudGF0aW9uLCBzdWNoIGFz
IG9uY2UgYSB0aW1lb3V0IGhhcyBiZWVuIHN1ZmZlcmVkLCBzdWJzZXF1ZW50Cj4gY29tcGxldGlv
bnMgY2FuJ3QgYmUgY29ycmVsYXRlZCB3aXRoIHRoZWlyIHJlcXVlc3RzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1i
eTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
