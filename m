From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 0/3] x86: make rsdp address accessible
 via boot params
Date: Wed, 10 Oct 2018 09:28:15 +0200
Message-ID: <38478407-257c-c5a3-fbae-231bc739d768__21821.8227652416$1539156425$gmane$org@suse.com>
References: <20181010061456.22238-1-jgross@suse.com>
 <20181010062352.GC37224@gmail.com>
 <12afa65a-9e07-bb2c-5621-85074ea37135@suse.com>
 <20181010071918.GA103159@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mkav=mw=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gA8uq-0001AG-Vy
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 07:28:21 +0000
In-Reply-To: <20181010071918.GA103159@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: corbet@lwn.net, Peter Zijlstra <a.p.zijlstra@chello.nl>, linux-doc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de, boris.ostrovsky@oracle.com, Kees Cook <keescook@chromium.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTAvMjAxOCAwOToxOSwgSW5nbyBNb2xuYXIgd3JvdGU6Cj4gCj4gKiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+IAo+PiBZb3UgY2FuIGp1c3QgZGl2ZSBpbnRv
IHRoZSBkaXNjdXNzaW9uIHdlIGhhZCBiYWNrIGluIEZlYnJ1YXJ5Ogo+IAo+IFRoYXQgd2FzIGhh
bGYgYSB5ZWFyIGFuZCBhIHRob3VzYW5kIGNvbW1pdHMgYWdvISA7LSkKClllcy4gOi0pCgo+IAo+
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTgwMjEzMTYzMjQ0LmoyenV4eWhzNGti
Zmh3Z2pAZ21haWwuY29tLwo+Pgo+PiBUaGUgc2NoZW1lIEkgaGF2ZSB1c2VkIGluIFY1IG9mIHRo
ZSBzZXJpZXMgaXMgdGhlIG9uZSB5b3UgYWdyZWVkIHRvIHVzZQo+PiBiYWNrIHRoZW4uCj4+Cj4+
IEEgcXVpY2sgc3VtbWFyeSBvZiB0aGUgcHJvYmxlbSB5b3UgbWVudGlvbmVkOgo+Pgo+PiBUaGVy
ZSBhcmUgc29tZSBkb3duc3RyZWFtIHZhcmlhbnRzIG9mIGdydWIyIHdpdGggYSBwYXRjaCBicmVh
a2luZyB0aGUKPj4gYm9vdCBwcm90b2NvbCBieSB3cml0aW5nIGdhcmJhZ2UgcGFzdCB0aGUgZW5k
IG9mIHNldHVwX2hlYWRlci4gQWRkaW5nCj4+IGEgbmV3IGZpZWxkIGF0IHRoZSBlbmQgb2Ygc2V0
dXBfaGVhZGVyIChoZXJlOiByc2RwX2FkZHJlc3MpIHJlc3VsdGVkIGluCj4+IHRob3NlIGdydWIy
IHZhcmlhbnRzIGNsb2JiZXJpbmcgdGhlIHByZXNldCB2YWx1ZSBvZiAwLgo+Pgo+PiBUaGUgc29s
dXRpb24gaXMgdG8gbGV0IGdydWIyIHJlcG9ydCBiYWNrIHRoZSB1c2VkIGJvb3QgcHJvdG9jb2wg
dmVyc2lvbgo+PiB3aXRoIHNldHRpbmcgYSBmbGFnICJJIGFtIHJlcG9ydGluZyBiYWNrIG15IHZl
cnNpb24iLiBUaGUga2VybmVsIG5vdyBpcwo+PiBjYXBhYmxlIHRvIGtub3cgd2hpY2ggZmllbGRz
IG9mIHNldHVwX2hlYWRlciBhcmUga25vd24gdG8gZ3J1YjIgYW5kIGNhbgo+PiBhY3QgYWNjb3Jk
aW5nbHkuCj4+Cj4+IFRoZSByZWxhdGVkIGdydWIyIHBhdGNoIHNlcmllcyBpcyB1bmRlciByZXZp
ZXcgcmlnaHQgbm93Lgo+IAo+IE9rLCB0aGF0J3MgcmVhc3N1cmluZyAtIHRoYXQncyBhbGwgdGhl
IGNvbnRleHQgSSBuZWVkZWQuCj4gCj4gV291bGQgaXQgaGVscCBncnViMiByZXZpZXcraW50ZWdy
YXRpb24gaWYgd2UgYXBwbGllZCB0aGlzIHRvIC10aXAgYW5kIHN0YWdlZAo+IGl0IHRoZXJlIHVu
dGlsIHRoZSBHcnViIHBhdGNoZXMgYXJlIGFjY2VwdGVkLCBvciBjYW4gSSBjb25zaWRlciB0aG9z
ZSBjaGFuZ2VzCj4gYXMgZ3J1YjIgdXBzdHJlYW0gYWNjZXB0ZWQ/CgpBcHBseWluZyB0byAtdGlw
IHdvdWxkIHJlYWxseSBiZSBncmVhdCEgSSBjYW4gc2VuZCB5b3UgYSBub3RlIHdoZW4gdGhlCmdy
dWIgc2VyaWVzIGhhcyBiZWVuIGFjY2VwdGVkLiBUaGUgZ3J1YiBtYWludGFpbmVyIGhhcyBhbHJl
YWR5IHNlbnQgbWUKYSBub3RlIGhlIHdpbGwgYmUgbG9va2luZyBhdCB0aGUgcGF0Y2hlcyBzb29u
LgoKPiBJJ2QgbGlrZSB0byBoZWxwIG1ha2UgaXQgaGFwcGVuLCBsZXQgbWUga25vdyB3aGF0IHRo
ZSBiZXN0IHJvdXRlIGlzLgoKSSBhcHByZWNpYXRlIHRoYXQgYSBsb3QhCgoKVGhhbmtzLAoKSnVl
cmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
