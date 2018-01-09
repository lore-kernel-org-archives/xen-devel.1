From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 1/8] x86/domctl: introduce a pair of
 hypercall to set and get cpu topology
Date: Tue, 9 Jan 2018 23:47:54 +0000
Message-ID: <eaeb4016-0534-afa2-fcce-8146bfcdc160@citrix.com>
References: <1515384090-175916-1-git-send-email-chao.gao@intel.com>
 <1515384090-175916-2-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515384090-175916-2-git-send-email-chao.gao@intel.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>, xen-devel@lists.xen.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMDEvMTggMDQ6MDEsIENoYW8gR2FvIHdyb3RlOgo+IERlZmluZSBpbnRlcmZhY2UsIHN0
cnVjdHVyZXMgYW5kIGh5cGVyY2FsbHMgZm9yIHRvb2xzdGFjayB0byBidWlsZAo+IGNwdSB0b3Bv
bG9neSBhbmQgZm9yIGd1ZXN0IHRoYXQgd2lsbCByZXRyaWV2ZSBpdCBbMV0uCj4gVHdvIHN1Ym9w
IGh5cGVyY2FsbHMgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoOgo+IFhFTl9ET01DVExfc2V0X2Nw
dV90b3BvbG9neSB0byBkZWZpbmUgY3B1IHRvcG9sb2d5IGluZm9ybWF0aW9uIHBlciBkb21haW4K
PiBhbmQgWEVOTUVNX2dldF9jcHVfdG9wb2xvZ3kgdG8gcmV0cmlldmUgY3B1IHRvcG9sb2d5IGlu
Zm9ybWF0aW9uLgo+Cj4gWzFdOiBkdXJpbmcgZ3Vlc3QgY3JlYXRpb24sIHRob3NlIGluZm9ybWF0
aW9uIGhlbHBzIGh2bWxvYWRlciB0byBidWlsZCBBQ1BJLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hh
byBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KCkknbSBzb3JyeSwgYnV0IHRoaXMgZ29pbmcgaW4g
dGhlIHdyb25nIGRpcmVjdGlvbi7CoCBEZXRhaWxzIGxpa2UgdGhpcwpzaG91bGQgYmUgY29udGFp
bmVkIGFuZCBjb21tdW5pY2F0ZWQgZXhjbHVzaXZlbHkgaW4gdGhlIENQVUlEIHBvbGljeS4KCkJl
Zm9yZSB0aGUgc3BlY3RyZS9tZWx0ZG93biBmaXJlIHN0YXJ0ZWQsIEkgaGFkIGEgcHJvdG90eXBl
IHNlcmllcwppbnRyb2R1Y2luZyBhIHRvb2xzdGFjayBpbnRlcmZhY2UgZm9yIGdldHRpbmcgYW5k
IHNldHRpbmcgYSBmdWxsIENQVUlECnBvbGljeSBhdCBvbmNlLCByYXRoZXIgdGhhbiBwaWVjZXdp
c2UuwqAgSSB3aWxsIGJlIGNvbnRpbnVpbmcgd2l0aCB0aGlzCndvcmsgb25jZSB0aGUgZHVzdCBz
ZXR0bGVzLgoKSW4gcGFydGljdWxhciwgd2Ugc2hvdWxkIG5vdCBoYXZlIG11bHRpcGxlIHdheXMg
b2YgY29udmV5aW5nIHRoZSBzYW1lCmluZm9ybWF0aW9uLCBvciBkdXBsaWNhdGlvbiBvZiB0aGUg
c2FtZSBkYXRhIGluc2lkZSB0aGUgaHlwZXJ2aXNvci4KCklmIHlvdSByZWFycmFuZ2UgeW91ciBz
ZXJpZXMgdG8gcHV0IHRoZSBzdHJ1Y3QgY3B1aWRfcG9saWN5IGNoYW5nZXMKZmlyc3QsIHRoZW4g
cGF0Y2ggMiB3aWxsIGJlY29tZSBmYXIgbW9yZSBzaW1wbGUuwqAgSFZNTG9hZGVyIHNob3VsZApk
ZXJpdmUgaXRzIHRvcG9sb2d5IGluZm9ybWF0aW9uIGZyb20gdGhlIENQVUlEIGluc3RydWN0aW9u
LCBqdXN0IGFzIGlzCmV4cGVjdGVkIG9uIG5hdGl2ZSBoYXJkd2FyZS4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
