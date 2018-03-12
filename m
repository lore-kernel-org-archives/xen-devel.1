From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] x86: use invpcid to do global flushing
Date: Mon, 12 Mar 2018 14:14:26 +0100
Message-ID: <41f29a48-be57-11a9-413d-eeb29eb7e3f2@suse.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-3-wei.liu2@citrix.com>
 <5AA2B67302000078001B0567@suse.com>
 <4fb72f31-683d-1de3-db90-4788a379b0bd@suse.com>
 <5AA679BD0200007800129C56@prv-mh.provo.novell.com>
 <4c0abb8c-7c16-6a89-29c1-d20e4c16e4c2@suse.com>
 <5AA67CEF0200007800129C5D@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=19pq=gc=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1evNHZ-0006Rp-Dm
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 13:14:29 +0000
In-Reply-To: <5AA67CEF0200007800129C5D@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDMvMTggMTQ6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4gMDMvMTIvMTggMjoxMCBQTSA+Pj4KPj4gQlRXOiBhcmUgeW91IGFs
cmVhZHkgd29ya2luZyBvbiByZWJhc2luZyB5b3VyIFhQVEkgc3BlZWQgdXAgc2VyaWVzIHRvCj4+
IGN1cnJlbnQgc3RhZ2luZz8gSSdkIGxpa2UgbXkgc2VyaWVzIHRvIHVzZSB5b3VyIHNlcmllcyBh
cyBhIGJhc2UgdW5sZXNzCj4+IHlvdSBhcmUgdGVsbGluZyBtZSB5b3Ugd29uJ3QgYmUgYWJsZSB0
byByZXNlbmQgeW91ciBzZXJpZXMgc29vbi4KPiAKPiBJIGhvcGUgdG8gYmUgYWJsZSB0byBnZXQg
dG8gdGhpcyBsYXRlciB0aGlzIHdlZWsuCgpPa2F5LCB0aGFua3MuCgoKSnVlcmdlbgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
