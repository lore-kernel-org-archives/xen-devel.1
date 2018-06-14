From: Juergen Gross <jgross@suse.com>
Subject: Re: How to deal with hypercalls returning -EFAULT
Date: Thu, 14 Jun 2018 10:48:41 +0200
Message-ID: <37b12549-a61b-c80d-82b0-3687bc9b173c@suse.com>
References: <ad5db530-fea5-7f28-2c7f-4244fc006583@suse.com>
 <10af8cc2-43cb-8b9e-e700-56b467c26a7d@citrix.com>
 <7922636b-e78e-6da6-0467-5c0831f75abd@suse.com>
 <CAF3u54AyNyrfiAGN4zMq1BeX8ojjZX7FbSiJP53+6EC3ayJ61Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ltl4=ja=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fTNvz-0006OP-Dd
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 08:48:47 +0000
In-Reply-To: <CAF3u54AyNyrfiAGN4zMq1BeX8ojjZX7FbSiJP53+6EC3ayJ61Q@mail.gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDYvMTggMTA6MTcsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IFNvcnJ5IGZvciB0aGUgZm9ybWF0dGluZy4KPiAKPiBPbiBUaHUsIDE0IEp1biAyMDE4LCAwNzo0
MCBKdWVyZ2VuIEdyb3NzLCA8amdyb3NzQHN1c2UuY29tCj4gPG1haWx0bzpqZ3Jvc3NAc3VzZS5j
b20+PiB3cm90ZToKPiAKPiAgICAgT24gMTMvMDYvMTggMTg6MjUsIEFuZHJldyBDb29wZXIgd3Jv
dGU6Cj4gICAgID4gT24gMTMvMDYvMTggMTY6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gCj4g
ICAgIExvb2tpbmcgbW9yZSBpbnRvIHRoZSBwcml2Y21kIGRyaXZlciBJJ20gcmF0aGVyIHN1cmUg
bm93IEkgY2FuIHNvbHZlCj4gICAgIHRoaXMgdmlhIG1tYXAoKSBwbHVzIGFuIGlvY3RsKCkuIFNv
IHRoZSBrZXJuZWwgd291bGQgYWxsb2NhdGUgdGhlCj4gICAgIGJvdW5jZSBidWZmZXJzIGFuZCBt
YXAgdGhlbSBpbnRvIHVzZXIgc3BhY2UuIFRoaXMgd2lsbCByZXF1aXJlIGNoYW5nZXMKPiAgICAg
b25seSBpbiBsaWJ4ZW5jYWxsIHdpdGhvdXQgaGF2aW5nIHRvIG1vZGlmeSBpdHMgZXh0ZXJuYWwg
aW50ZXJmYWNlLgo+IAo+IAo+IEl0IGxvb2tzIGxpa2UgRGF2aWQgVnJhYmVsIHNlbnQgaW4gMjAx
NiBhIHBhdGNoIGltcGxlbWVudGluZyB0aGF0Cj4gc29sdXRpb24gWzFdLiBJdCBzZWVtcyBpdCBo
YXMgbm90IGJlZW4gbWVyZ2VkLiBEbyB5b3UgaGF2ZSBhbnkgaW5zaWdodAo+IHdoeSBpdCB3YXMg
bm90IG1lcmdlZD8KCk5vLiBJdCBoYWQgYWxsIG5lZWRlZCBBY2tzIGFuZCB0aGVyZSB3ZXJlIG5v
IG9wZW4gcXVlc3Rpb25zLgoKVGhhbmtzIGZvciB0aGUgcmVmZXJlbmNlLCBJIHRoaW5rIEkgY2Fu
IGp1c3QgcmV1c2UgdGhlIHBhdGNoIGFmdGVyIHNvbWUKcmViYXNpbmcuCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
