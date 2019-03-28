From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 6/6] xen/sched: don't disable scheduler on
 cpus during suspend
Date: Thu, 28 Mar 2019 06:41:27 +0100
Message-ID: <9a97cb91-6c72-1281-0d1c-55c769f225a6@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-7-jgross@suse.com>
 <cd406cd362b1af495d8f84585b8cff1b706203fe.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zgNs=R7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9Nn9-0007Oq-Pi
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 05:41:31 +0000
In-Reply-To: <cd406cd362b1af495d8f84585b8cff1b706203fe.camel@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDMvMjAxOSAwMDoxMCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gTW9uLCAyMDE5
LTAzLTE4IGF0IDE0OjExICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBUb2RheSB0aGVy
ZSBpcyBzcGVjaWFsIGhhbmRsaW5nIGluIGNwdV9kaXNhYmxlX3NjaGVkdWxlcigpIGZvcgo+PiBz
dXNwZW5kCj4+IGJ5IGZvcmNpbmcgYWxsIHZjcHVzIHRvIHRoZSBib290IGNwdS4gSW4gZmFjdCB0
aGVyZSBpcyBubyBuZWVkIGZvcgo+PiB0aGF0Cj4+IGFzIGR1cmluZyByZXN1bWUgdGhlIHZjcHVz
IGFyZSBwdXQgb24gdGhlIGNvcnJlY3QgY3B1cyBhZ2Fpbi4KPj4KPj4gU28gd2UgY2FuIGp1c3Qg
b21pdCB0aGUgY2FsbCBvZiBjcHVfZGlzYWJsZV9zY2hlZHVsZXIoKSB3aGVuCj4+IG9mZmxpbmlu
Zwo+PiBhIGNwdSBkdWUgdG8gc3VzcGVuZCBhbmQgb24gcmVzdW1pbmcgd2UgY2FuIG9taXQgdGFr
aW5nIHRoZSBzY2hlZHVsZQo+PiBsb2NrIGZvciBzZWxlY3RpbmcgdGhlIG5ldyBwcm9jZXNzb3Iu
Cj4+Cj4+IEluIHJlc3RvcmVfdmNwdV9hZmZpbml0eSgpIHdlIHNob3VsZCBiZSBjYXJlZnVsIHdo
ZW4gYXBwbHlpbmcKPj4gYWZmaW5pdHkKPj4gYXMgdGhlIGNwdSBtaWdodCBub3QgaGF2ZSBjb21l
IGJhY2sgdG8gbGlmZS4gVGhpcyBpbiB0dXJuIGVuYWJsZXMgdXMKPj4gdG8gZXZlbiBzdXBwb3J0
IGFmZmluaXR5X2Jyb2tlbiBhY3Jvc3Mgc3VzcGVuZC9yZXN1bWUuCj4+Cj4+IEF2b2lkIGFsbCBv
dGhlciBzY2hlZHVsZXIgZGVhbGxvYyAtIGFsbG9jIGRhbmNlIHdoZW4gZG9pbmcgc3VzcGVuZAo+
PiBhbmQKPj4gcmVzdW1lLCB0b28uIEl0IGlzIGVub3VnaCB0byByZWFjdCBvbiBjcHVzIGZhaWxp
bmcgdG8gY29tZSB1cCBvbgo+PiByZXN1bWUKPj4gYWdhaW4uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4KPiBPaywgSSB0aGluayB0aGlzIHBh
dGNoIGlzIGZpbmUuCj4gCj4gUmV2aWV3ZWQtYnk6IERhcmlvIEZhZ2dpb2xpIDxkZmFnZ2lvbGlA
c3VzZS5jb20+Cj4gCj4gSSBndWVzcyB5b3UgaGF2ZSB0ZXN0ZWQgYm90aCBjcHUgb2ZmL29uLWxp
bmluZyBhbmQgc3VzcGVuZC9yZXN1bWUsIG9yCj4gZG8geW91IG5lZWQgaGVscCB3aXRoIHRoYXQ/
IChPbmUgb2YgbXkgdGVzdGJveGVzIHRoYXQgSSBoYXZlIGhlcmUsCj4gc2hvdWxkIGJlIGFibGUg
dG8gZG8gc3VzcGVuZCkKCkkndmUgdGVzdGVkIHN1c3BlbmQvcmVzdW1lLgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
