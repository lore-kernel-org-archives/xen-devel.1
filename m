From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] Make credit2 the default scheduler
Date: Fri, 14 Sep 2018 02:45:35 -0600
Message-ID: <5B9B752F02000078001E88AD@prv1-mh.provo.novell.com>
References: <20180913163848.32216-1-george.dunlap@citrix.com>
 <cc2e661cc8543353929aebf1f190abd109ff2b82.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ck89=l4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g0jjO-00087s-Ss
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 08:45:38 +0000
In-Reply-To: <cc2e661cc8543353929aebf1f190abd109ff2b82.camel@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com, Dario Faggioli <dfaggioli@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA5LjE4IGF0IDE4OjUxLCA8ZGZhZ2dpb2xpQHN1c2UuY29tPiB3cm90ZToKPiBP
biBUaHUsIDIwMTgtMDktMTMgYXQgMTc6MzggKzAxMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+
IENyZWRpdDIgd2FzIGRlY2xhcmVkICJzdXBwb3J0ZWQiIGluIDQuOCwgYW5kIGFzIG9mIDQuMTAg
aGFkIHR3byBvdGhlcgo+PiBjcml0aWNhbCBmZWF0dXJlcyBpbXBsZW1lbnRlZCAoc29mdCBhZmZp
bml0eSAvIE5VTUEgYW5kIGNhcHMpLgo+PiAKPj4gWy4uXQo+Pgo+PiBDcmVkaXQyLCBsaWtlIGNy
ZWRpdCwgaGFzIGEgbnVtYmVyIG9mIHdvcmtsb2FkcyAvIHNldHVwcyBmb3Igd2hpY2gKPj4gcGVy
Zm9ybWFuY2UgY291bGQgYmUgaW1wcm92ZWQuICBQZXJzb25hbGx5IEkgdGhpbmsgbmV0d29ya2lu
ZyBhbmQKPj4gcGFydGlhbGx5LWxvYWRlZCBzeXN0ZW1zIGlzIGdvaW5nIHRvIGJlIG1vcmUgcmVw
cmVzZW50YXRpdmUgb2Ygd2hhdAo+PiBYZW4gaXMgYWN0dWFsbHkgdXNlZCBmb3I7IHNvIEkgdGhp
bmsgY3JlZGl0MiBpcyBvbiB0aGUgd2hvbGUgdGhlCj4+IGJldHRlciBzY2hlZHVsZXIgdG8gdXNl
IGJ5IGRlZmF1bHQuICBBbmQgaW4gYW55IGNhc2UsIG1ha2luZyB0aG9zZQo+PiBpbXByb3ZlbWVu
dHMgb24gY3JlZGl0MiB3aWxsIGJlIGVhc2llciB0aGFuIG9uIGNyZWRpdC4KPj4gCj4+IFNpZ25l
ZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPj4KPiBB
ZnRlciBhbGwgdGhlIGVmZm9ydCB3ZSd2ZSBzcGVudCBvbiB0aGlzLCBJJ20gcmVhbGx5LCByZWFs
bHkgaGFwcHkgdG8KPiBzZWUgdGhpcyAodHJ5aW5nIHRvKSBoYXBwZW4uIFRoYW5rcyBmb3Igc2Vu
ZGluZyB0aGUgcGF0Y2guIDotKQo+IAo+IEkgZnVsbHkgYWdyZWUgd2l0aCBhbmQgc2Vjb25kIEdl
b3JnZSdzIHJlYXNvbmluZywgYW5kIGZlZWwgMTAwJSBsaWtlCj4gcHJvdmlkaW5nIG15Ogo+IAo+
IEFja2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgoKQW5kIHRoYXQn
cyBkZXNwaXRlICJzY2hlZD1jcmVkaXQyIGNyYXNoZXMgc3lzdGVtIHdoZW4gdXNpbmcKY3B1cG9v
bHMiPyBXaGlsZSBJIGFncmVlIHRoYXQgd2Ugc2hvdWxkbid0IGRlbGF5IHRoZSBzd2l0Y2ggZm9y
Cm11Y2ggbG9uZ2VyLCBpbiBwYXJ0aWN1bGFyIHdpdGggdGhlcmUgYWxyZWFkeSBiZWluZyBhIGZp
eCBhdmFpbGFibGUKZnJvbSB5b3UgSSB0aGluayB0aGF0IG9uZSBzaG91bGQgZ28gaW4gYmVmb3Jl
IHRoZSBvbmUgaGVyZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
