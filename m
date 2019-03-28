From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/6] xen: don't free percpu areas during
 suspend
Date: Thu, 28 Mar 2019 07:39:30 -0600
Message-ID: <5C9CCE9202000078002227BF@prv1-mh.provo.novell.com>
References: <20190328120658.11083-1-jgross@suse.com>
 <20190328120658.11083-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9VFm-0000fi-Vc
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 13:39:35 +0000
In-Reply-To: <20190328120658.11083-5-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE5IGF0IDEzOjA2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbnN0
ZWFkIG9mIGZyZWVpbmcgcGVyY3B1IGFyZWFzIGR1cmluZyBzdXNwZW5kIGFuZCBhbGxvY2F0aW5n
IHRoZW0KPiBhZ2FpbiB3aGVuIHJlc3VtaW5nIGtlZXAgdGhlbS4gT25seSBmcmVlIGFuIGFyZWEg
aW4gY2FzZSBhIGNwdSBkaWRuJ3QKPiBjb21lIHVwIGFnYWluIHdoZW4gcmVzdW1pbmcuCj4gCj4g
SXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgdGhlcmUgaXMgYSBwb3RlbnRpYWwgY2hhbmdlIGluIGJl
aGF2aW91ciBhcwo+IHRoZSBwZXJjcHUgYXJlYXMgYXJlIG5vIGxvbmdlciB6ZXJvZWQgb3V0IGR1
cmluZyBzdXNwZW5kL3Jlc3VtZS4gV2hpbGUKPiBJIGhhdmUgY2hlY2tlZCB0aGUgY2FsbGVkIGNw
dSBub3RpZmllciBob29rcyB0byBjb3BlIHdpdGggdGhhdCB0aGVyZQo+IG1pZ2h0IGJlIHNvbWUg
d2VsbCBoaWRkZW4gZGVwZW5kZW5jeSBvbiB0aGUgcHJldmlvdXMgYmVoYXZpb3VyLiBPVE9ICj4g
YSBjb21wb25lbnQgbm90IHJlZ2lzdGVyaW5nIGl0c2VsZiBmb3IgY3B1IGRvd24vdXAgYW5kIGV4
cGVjdGluZyB0bwo+IHNlZSBhIHplcm9lZCBwZXJjcHUgdmFyaWFibGUgYWZ0ZXIgc3VzcGVuZC9y
ZXN1bWUgaXMga2luZCBvZiBicm9rZW4KPiBhbHJlYWR5LgoKQmFjayBhdCB0aGUgdGltZSBpdCB3
YXMgaW50ZW50aW9uYWwgdG8gaGF2ZSB0aGlzIGJlaGF2aW9yLCBhbmQgY29kZQp3YXMgaW4gZmFj
dCB3cml0dGVuIHRvIHJlbHkgb24gaXQuIFdoYXQgSSBjYW4ndCBpbW1lZGlhdGVseSB0ZWxsIGlz
CndoZXRoZXIgYWxsIHN1Y2ggY29kZSBoYXMgZ29uZSBhd2F5LgoKPiBBbmQgdGhlIG9wcG9zaXRl
IGNhc2UsIHdoZXJlIGEgY29tcG9uZW50IGlzIG5vdCByZWdpc3RlcmVkCj4gdG8gYmUgY2FsbGVk
IGZvciBjcHUgZG93bi91cCBhbmQgaXMgbm90IGV4cGVjdGluZyBhIHBlcmNwdSB2YXJpYWJsZQo+
IHN1ZGRlbmx5IHRvIGJlIHplcm8gZHVlIHRvIHN1c3BlbmQvcmVzdW1lIGlzIG11Y2ggbW9yZSBw
cm9iYWJsZSwKPiBlc3BlY2lhbGx5IGFzIHRoZSBzdXNwZW5kL3Jlc3VtZSBmdW5jdGlvbmFsaXR5
IHNlZW1zIG5vdCB0byBiZSB0ZXN0ZWQKPiB0aGF0IG9mdGVuLgoKUmlnaHQsIGJ1dCBDUFUgb2Zm
bGluZS9vbmxpbmUgaXMgcHJldHR5IGVhc3kgdG8gdGVzdCAoYW5kCmluZGVwZW5kZW50IG9mIGZp
cm13YXJlIHN1cHBvcnQpLCBhbmQgaXQgd291bGQgY29udGludWUgdG8KaGF2ZSB0aGUgb2JzZXJ2
ZWQgZWZmZWN0LiBJIGFncmVlIHRob3VnaCB0aGF0IGZvciBzdXNwZW5kLwpyZXN1bWUgaXQgaXMg
bW9yZSBsaWtlbHkgdG8gYmUgd2FudGVkIHRvIGhhdmUgdGhlIGRhdGEKcmV0YWluZWQuIEJ1dCBk
b24ndCBmb3JnZXQgdGhhdCBpdCB3YXMgYWx3YXlzIGltcGxpZWQgdGhhdCBBUHMKd291bGQgZ28g
ZnVsbHkgZG93biBhbmQgdGhlbiBjb21lIGJhY2sgdXAgZHVyaW5nIGEgc3VzcGVuZC8KcmVzdW1l
IGN5Y2xlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
