From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 2/2] x86: allow Meltdown band-aid to be
 disabled
Date: Tue, 16 Jan 2018 13:21:34 +0100
Message-ID: <c57288e4-d351-7de3-8a60-467c45c09542@suse.com>
References: <5A5C981A020000780019EB82@prv-mh.provo.novell.com>
 <5A5C996A020000780019EB97@prv-mh.provo.novell.com>
 <CAFLBxZa12YCq_=jnPK_s-ZbRk6=p9AL+MY0K=SiJL+e-OT+4ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ahwt=el=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ebQFM-0007SH-Rd
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 12:21:44 +0000
In-Reply-To: <CAFLBxZa12YCq_=jnPK_s-ZbRk6=p9AL+MY0K=SiJL+e-OT+4ZA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDEvMTggMTM6MTIsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gTW9uLCBKYW4gMTUs
IDIwMTggYXQgMTE6MDcgQU0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6
Cj4+IEZpcnN0IG9mIGFsbCB3ZSBkb24ndCBuZWVkIGl0IG9uIEFNRCBzeXN0ZW1zLiBBZGRpdGlv
bmFsbHkgYWxsb3cgaXRzIHVzZQo+PiB0byBiZSBjb250cm9sbGVkIGJ5IGNvbW1hbmQgbGluZSBv
cHRpb24uIEZvciBiZXN0IGJhY2twb3J0YWJpbGl0eSwgdGhpcwo+PiBpbnRlbnRpb25hbGx5IGRv
ZXNuJ3QgdXNlIGFsdGVybmF0aXZlIGluc3RydWN0aW9uIHBhdGNoaW5nIHRvIGFjaGlldmUKPj4g
dGhlIGludGVuZGVkIGVmZmVjdCAtIHdoaWxlIHdlIGxpa2VseSB3YW50IGl0LCB0aGlzIHdpbGwg
YmUgbGF0ZXIKPj4gZm9sbG93LXVwLgo+IAo+IElzIGl0IHdvcnRoIG1ha2luZyBpdCBvcHRpb25h
bCB0byBhcHBseSB0byBkb20wPyAgSW4gbW9zdCBjYXNlcywgaWYgYW4KPiBhdHRhY2tlciBjYW4g
bWFuYWdlIHRvIGdldCB1c2Vyc3BhY2Ugb24gZG9tMCwgdGhleSBzaG91bGQgYmUgYWJsZSB0bwo+
IHRha2Ugb3ZlciB0aGUgd2hvbGUgc3lzdGVtIGFueXdheTsgdHVybmluZyBpdCBvZmYgb24gZG9t
MCB0byBnZXQKPiBiZXR0ZXIgcGVyZm9ybWFuY2Ugc2VlbXMgbGlrZSBhIHBvbGljeSBkZWNpc2lv
biB0aGF0IGFkbWluaXN0cmF0b3JzCj4gbWlnaHQgcmVhc29uYWJseSBtYWtlLgoKWW91IGFyZSBp
bXBseWluZyBoZXJlIHRoYXQgTGludXggaXMgaW5zZWN1cmU6IHdoeSBkb2VzIHVzZXJzcGFjZSBh
Y2Nlc3MKYWxsb3cgeW91IHRvIHRha2Ugb3ZlciB0aGUgbWFjaGluZT8gSSBjYW4gc2VlIHRoYXQg
YmVpbmcgdHJ1ZSBmb3Igcm9vdAphY2Nlc3MsIGJ1dCBub3QgZm9yIGFueSBvdGhlciB1bnByaXZp
bGVnZWQgdXNlciBhY2NvdW50LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
