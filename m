From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Tue, 13 Mar 2018 10:27:56 +0100
Message-ID: <a84911d5-cbf0-0c6f-8c9f-c479aa1e54ee@suse.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-3-wei.liu2@citrix.com>
 <5AA2B67302000078001B0567@suse.com>
 <4fb72f31-683d-1de3-db90-4788a379b0bd@suse.com>
 <5AA679BD0200007800129C56@prv-mh.provo.novell.com>
 <4c0abb8c-7c16-6a89-29c1-d20e4c16e4c2@suse.com>
 <5AA794B402000078001B0CC7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=duv2=gd=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1evgDv-0001MO-2P
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 09:27:59 +0000
In-Reply-To: <5AA794B402000078001B0CC7@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMTggMDk6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEyLjAzLjE4IGF0
IDE0OjEwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gQlRXOiBhcmUgeW91IGFscmVhZHkg
d29ya2luZyBvbiByZWJhc2luZyB5b3VyIFhQVEkgc3BlZWQgdXAgc2VyaWVzIHRvCj4+IGN1cnJl
bnQgc3RhZ2luZz8gSSdkIGxpa2UgbXkgc2VyaWVzIHRvIHVzZSB5b3VyIHNlcmllcyBhcyBhIGJh
c2UgdW5sZXNzCj4+IHlvdSBhcmUgdGVsbGluZyBtZSB5b3Ugd29uJ3QgYmUgYWJsZSB0byByZXNl
bmQgeW91ciBzZXJpZXMgc29vbi4KPiAKPiBDb21pbmcgYmFjayB0byBteSByZXBseSBoZXJlIHll
c3RlcmRheSAtIHRoZW4gYWdhaW4gSSdtIGEgbGl0dGxlCj4gcmVsdWN0YW50IHRvIHNlbmQgb3V0
IGEgbmV3IHZlcnNpb24gdGhhdCBoYXMgbm8gY2hhbmdlcyBvdGhlcgo+IHRoYW4gYmVpbmcgcmUt
YmFzZWQsIHdoZW4gdGhlcmUgd2VyZSBubyBjb21tZW50cyBieSBBbmRyZXcKPiBvbiBtb3N0IG9m
IHRoZSByZW1haW5pbmcgcGF0Y2hlcyB5ZXQgKGFuZCBpbiB0aGUgb25lIGNhc2UKPiB3aGVyZSB0
aGVyZSB3ZXJlIGNvbW1lbnRzLCBJJ20gYWZyYWlkIEkgY29udGludWUgdG8gZGlzYWdyZWUsCj4g
YnV0IEknbGwgc2VlIGFib3V0IG1vdmluZyB0aGF0IHBhdGNoIGxhc3QgaW4gdGhlIHNlcmllcyku
CgpJbiBvcmRlciB0byBtb3ZlIGZvcndhcmQsIHdvdWxkIHlvdSBwcmVmZXIgbWUgdG8gYmFzZSBt
eSBwYXRjaGVzIG9uCmN1cnJlbnQgc3RhZ2luZyBhbmQgcHV0IHlvdXIgcGF0Y2hlcyBvbiB0b3Ag
b2YgbXkgc2VyaWVzIGxhdGVyPyBJIGp1c3QKZG9uJ3Qgd2FudCB0byByZWJhc2UgbXkgc2VyaWVz
IG9uIGEgbW92aW5nIHRhcmdldC4uLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
