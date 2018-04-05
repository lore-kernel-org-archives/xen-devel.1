From: Ajay Garg <ajaygargnsit@gmail.com>
Subject: Re: Xen-4.10 Domain-0 crashes at bootup
Date: Thu, 5 Apr 2018 20:05:25 +0530
Message-ID: <CAHP4M8WJEaZtB0cZJGXRg-5g6x7dme8uXC87vWa707D=8u+_7Q@mail.gmail.com>
References: <CAHP4M8WiOD+RhbX2Eqk8z+1g=i0pcQNmJqM6X_hQ_u=K+A3ryw@mail.gmail.com>
 <alpine.LFD.2.21.1804041102390.2498@algedi.dur.ac.uk>
 <CAHP4M8WLxg+HaTs+L9SmhmkBiTugSR98YH8mvRx-T2i8A0q9jg@mail.gmail.com>
 <alpine.LFD.2.21.1804041549230.2498@algedi.dur.ac.uk>
 <d4a73b42-0bec-c237-51cd-88851ee0368e@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fi5o=g2=gmail.com=ajaygargnsit@srs-us1.protection.inumbo.net>)
 id 1f45z7-00047n-QN
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 14:35:29 +0000
In-Reply-To: <d4a73b42-0bec-c237-51cd-88851ee0368e@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, M A Young <m.a.young@durham.ac.uk>
List-Id: xen-devel@lists.xenproject.org

SGkgQWxsLgoKQXMgc3VnZ2VzdGVkIGJ5IE1pY2hhZWwuIEkgY29tcGlsZWQgdGhlIGtlcm5lbCBh
cyBwZXIKaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvMi8yMy81OSwgY29udGFpbmluZyB0aGUg
cGF0Y2gKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE4LTAyL21zZzAwMDQ1Lmh0bWwuCgpVcG9uIGluc3RhbGxpbmcgdGhpcyBmcmVzaCBrZXJu
ZWwsIHRoZSBtYWNoaW5lIGJvb3RlZCBmaW5lIHdpdGggWGVuCmVuYWJsZWQgKGp1c3QgbmVlZGVk
IGFuIGFkZGl0aW9uYWwgInN1ZG8gYXB0LWdldCBpbnN0YWxsIGxpYnlhamwtZGV2IgphbmQgYW5v
dGhlciByZWJvb3QgdG8gZ2V0IHRoZSBwcm9wZXIgbGlzdGluZyBvZiAiRG9tYWluLTAiLgoKU28s
IGF0IGxlYXN0IGZyb20gbXkgc2lkZSwgdGhpcyB0aHJlYWQgY2FuIGJlIG1hcmtlZCBzb2x2ZWQv
Y2xvc2VkLgoKClRoYW5rcyBhbmQgUmVnYXJkcywKQWpheQoKT24gV2VkLCBBcHIgNCwgMjAxOCBh
dCA4OjQ1IFBNLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+IE9uIDA0
LzA0LzE4IDE3OjAwLCBNIEEgWW91bmcgd3JvdGU6Cj4+IE9uIFdlZCwgNCBBcHIgMjAxOCwgQWph
eSBHYXJnIHdyb3RlOgo+Pgo+Pj4gVGhhbmtzIE1pY2hhZWwgZm9yIHRoZSByZXBseS4KPj4+Cj4+
PiBJIHdhbnQgdG8gZ2l2ZSB0aGlzIHBhdGNoIGEgdHJ5LCBhcyB0aGUgc3ltcHRvbXMgbG9vayBp
ZGVudGljYWwuCj4+PiBIb3dldmVyLCBJIHNlZSBubyB4ZW4taGVhZC5TIHdoZW4gSSBjbG9uZSB0
aGUgcmVwbyBmcm9tCj4+PiBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdAo+Pj4KPj4+IFdo
YXQgYW0gSSBtaXNzaW5nPwo+Pgo+PiBUaGUgcGF0Y2ggaXMgZm9yIHRoZSB4ZW4gY29kZSBpbiB0
aGUga2VybmVsLiBJdCB3YXMgYWNjZXB0ZWQgaW4gdGhlIGtlcm5lbAo+PiB1cHN0cmVhbSAoaW4g
NC4xNS41IGFuZCBwcm9iYWJseSBiYWNrcG9ydGVkIHRvIG90aGVyIG1haW50YWluZWQga2VybmVs
cykKPj4gc28geW91IHByb2JhYmx5IGp1c3QgbmVlZCBhIGtlcm5lbCBsZXNzIHRoYW4gYSBtb250
aCBvbGQsIGJ1dCBhcyBoYXMKPj4gYWxyZWFkeSBiZWVuIHNhaWQsIHRoZSBrZXJuZWwgbWF5IG5v
dCBiZSB0aGUgcHJvYmxlbS4KPgo+IEFuZCB0aGUgc3ltcHRvbXMgYXJlIGNvbXBsZXRlbHkgZGlm
ZmVyZW50ICh3ZWxsLCBhdCBsZWFzdCBmb3IgbWUpLgo+Cj4gQWpheSdzIGNyYXNoIGlzIGR1ZSB0
byBhbiBpbGxlZ2FsIGluc3RydWN0aW9uLCBzbyBwcm9iYWJseSBhIEJVRygpLgo+Cj4gVGhlIHBh
dGNoIGFib3ZlIGZpeGVzIGFuIGVhcmx5IHBhZ2UgZmF1bHQgaW4gdGhlIGtlcm5lbC4KPgo+Cj4g
SnVlcmdlbgoKCgotLSAKUmVnYXJkcywKQWpheQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
