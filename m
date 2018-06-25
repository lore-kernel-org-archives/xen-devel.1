From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.11 v2] x86/EFI: further correct FPU
 state handling around runtime calls
Date: Mon, 25 Jun 2018 13:27:49 +0100
Message-ID: <0d93c4c2-9e8a-ec56-9570-24a9d851551d@citrix.com>
References: <5B30DD5A02000078001CD80E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vgpp=jl=citrix.com=prvs=707a9d356=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fXQea-0003nu-Bk
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 12:31:32 +0000
In-Reply-To: <5B30DD5A02000078001CD80E@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDYvMTggMTM6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdlIG11c3Qgbm90IGxlYXZl
IGEgdkNQVSB3aXRoIENSMC5UUyBjbGVhciB3aGVuIGl0IGlzIG5vdCBpbiBmdWxseSBlYWdlcgo+
IG1vZGUgYW5kIGhhcyBub3QgdG91Y2hlZCBub24tbGF6eSBzdGF0ZS4gSW5zdGVhZCBvZiBhZGRp
bmcgYSAzcmQKPiBpbnZvY2F0aW9uIG9mIHN0dHMoKSB0byB2Y3B1X3Jlc3RvcmVfZnB1X2VhZ2Vy
KCksIGNvbnNvbGlkYXRlIGFsbCBvZgo+IHRoZW0gaW50byBhIHNpbmdsZSBvbmUgZG9uZSBhdCB0
aGUgZW5kIG9mIHRoZSBmdW5jdGlvbi4KPgo+IFJlbmFtZSB0aGUgZnVuY3Rpb24gYXQgdGhlIHNh
bWUgdGltZSB0byBiZXR0ZXIgcmVmbGVjdCBpdHMgcHVycG9zZSwgYXMKPiB0aGUgcGF0Y2hlcyB0
b3VjaGVzIGFsbCBvZiBpdHMgb2NjdXJlbmNlcyBhbnl3YXkuCj4KPiBUaGUgbmV3IGZ1bmN0aW9u
IHBhcmFtZXRlciBpcyBub3QgcmVhbGx5IHdlbGwgbmFtZWQsIGJ1dAo+ICJuZWVkX3N0dHNfaWZf
bm90X2Z1bGx5X2VhZ2VyIiBzZWVtZWQgZXhjZXNzaXZlIHRvIG1lLgoKUGVyaGFwcyBwdXQgdGhp
cyBpbiBhIGNvbW1lbnQgYmVzaWRlIHRoZSBkZWNsYXJhdGlvbi9kZWZpbml0aW9uP8KgIEZvcgpm
dXR1cmUgcGVvcGxlIHJlYWRpbmcgdGhpcyBjb2RlLCBpdHMgbW9yZSB1c2VmdWwgdGhlcmUgdGhh
biBpbiB0aGUKY29tbWl0IG1lc3NhZ2U/CgpFaXRoZXIgd2F5LCBSZXZpZXdlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
