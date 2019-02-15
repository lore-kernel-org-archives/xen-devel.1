From: Juergen Gross <jgross@suse.com>
Subject: Re: [OSSTEST PATCH] README.hardware-acquisition [and 1
 more messages]
Date: Fri, 15 Feb 2019 13:15:32 +0100
Message-ID: <71db3e4b-0e35-037a-7c20-776e1f9e3e2b@suse.com>
References: <20181030161326.17879-1-ian.jackson@eu.citrix.com>
 <18bf9618-d950-8cfa-1746-e330f3ce0e66@arm.com>
 <alpine.DEB.2.10.1810301528180.22840@sstabellini-ThinkPad-X260>
 <23513.52378.653350.705575@mariner.uk.xensource.com>
 <23654.43252.57463.874932@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LI7m=QW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gucP1-0006KQ-QV
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 12:15:35 +0000
In-Reply-To: <23654.43252.57463.874932@mariner.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, infra@xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMjAxOSAxMjo1NiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSWFuIEphY2tzb24gd3Jp
dGVzICgiUmU6IFtPU1NURVNUIFBBVENIXSBSRUFETUUuaGFyZHdhcmUtYWNxdWlzaXRpb24gW2Fu
ZCAxIG1vcmUgbWVzc2FnZXNdIik6Cj4+IFNvIG92ZXJhbGwsIGZvciB0aGUgcmVhc29ucyBJIGV4
cGxhaW4sIEknbSBnb2luZyB0byBjb21taXQgdGhpcwo+PiBkb2N1bWVudCAoc3ViamVjdCB0byB0
aGUgb3RoZXIgY29tbWVudHMgZXRjLikgKndpdGgqIHRoZSByZXF1aXJlbWVudAo+PiB0aGF0IGhh
cmR3YXJlIG11c3QgYmUgc3VwcG9ydGVkIGJ5IERlYmlhbiAoYXQgbGVhc3QsIGluIC1iYWNrcG9y
dHMpLgo+IAo+IFRoaXMgZGlkbid0IGhhcHBlbi4gIFRIZXJlIHdhcyBjb25zaWRlcmFibGUgZnVy
dGhlciBkaXNjdXNzaW9uLiAgVGhlCj4gZmFjdCB0aGF0IHZhcmlvdXMga2luZHMgb2YgdW5jZXJ0
YWludHkgbWVhbnQgdGhpcyBkb2N1bWVudCBkaWRuJ3QgZ2V0Cj4gY29tbWl0dGVkIGlzIG5vdyBi
bG9ja2luZyB1cyBnaXZpbmcgdGhlIGdvLWFoZWFkIGZvciBzb21lIG5ldyBoYXJkd2FyZQo+IGFj
cXVpc2l0aW9uOgo+IAo+IEllLCBJIGNhbid0IGFuc3dlciB0aGUgcXVlc3Rpb24gInNob3VsZCB3
ZSBhY2NlcHQgaGFyZHdhcmUgWFlaIgo+IHdpdGhvdXQgcmVmZXJlbmNlIHRvIGF0IGxlYXN0IGFu
IGltcGxpZWQgYSBjaGVja2xpc3QgbGlrZSB0aGlzLgo+IEhhdmluZyB3cml0dGVuIGl0IGRvd24g
SSBvdWdodCB0byB1c2UgdGhlIG9uZSBJJ3ZlIHdyaXR0ZW4gZG93biwKPiBiZWNhdXNlIHRvIGRv
IG90aGVyd2lzZSBpcyBzaW1wbHkgdG8gcG9pbnRsZXNzbHkgaW52aXRlIG1pc3Rha2VzLiAgQW5k
Cj4gaWYgSSdtIHRvIHVzZSBhIHdyaXR0ZW4tZG93biBjaGVja2xpc3QgaXQgc2hvdWxkIGJlIG9u
ZSB3aGljaCBpcwo+IGFjdHVhbGx5IG9mZmljaWFsLgo+IAo+IEFjY29yZGluZ2x5LCBJIGludGVu
ZCB0byBjb21taXQgdGhpcyB0byBvc3N0ZXN0IG5vdy4gIEp1ZXJnZW4sIHRoaXMgaXMKPiBqdXN0
IGEgZG9jdW1lbnQ6IGNhbiBJIGhhdmUgeW91ciByZWxlYXNlIGFjayBmb3IgaXQgPwoKWWVzLCBz
dXJlOgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
