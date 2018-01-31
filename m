From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] x86/acpi: add retrieval function for
	rsdp address
Date: Wed, 31 Jan 2018 17:43:40 +0200
Message-ID: <CAHp75Vf7SRNGeU_To9WNmzECxaKjDbYeFspnJiwCGAhAwOTRyA__19015.971318777$1517413363$gmane$org@mail.gmail.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-2-jgross@suse.com>
 <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
 <a33e605a-73d7-83b7-4472-14f66b6738be@suse.com>
 <CAHp75VdUO2Rq7geYD9xxY3nnzGAhO46+w+rQx44=MgJ6obRcEA@mail.gmail.com>
 <CAJZ5v0gr7Jd-1dOD_DTRQDCX7ON68O1KJ9ioAJAnwBYm2cEdZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wbgo=e2=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1eguY2-0006C9-P3
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 15:43:42 +0000
Received: by mail-qt0-x242.google.com with SMTP id c2so22337672qtn.9
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2018 07:43:41 -0800 (PST)
In-Reply-To: <CAJZ5v0gr7Jd-1dOD_DTRQDCX7ON68O1KJ9ioAJAnwBYm2cEdZg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjksIDIwMTggYXQgNTowMiBBTSwgUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPiBPbiBTdW4sIEphbiAyOCwgMjAxOCBhdCA0OjA0IFBNLCBB
bmR5IFNoZXZjaGVua28KPiA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE9u
IEZyaSwgSmFuIDI2LCAyMDE4IGF0IDg6MjEgUE0sIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cj4+PiBPbiAyNi8wMS8xOCAxOTowOCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+Pj4+IE9uIFRodSwgSmFuIDI1LCAyMDE4IGF0IDQ6MzYgUE0sIEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4gd3JvdGU6Cgo+Pj4+IFRoZSBwcm9ibGVtIHdpdGggd2VhayBmdW5jdGlv
bnMgdGhhdCB3ZSBjYW4ndCBoYXZlIG1vcmUgdGhhbiBvbmUKPj4+PiBpbXBsZW1lbnRhdGlvbiBw
ZXIga2VybmVsIHdoaWxlIHdlIHdvdWxkIGxpa2UgdG8gYnVpbHQgc2V2ZXJhbCBjb2RlCj4+Pj4g
cGF0aHMuCj4+Pj4KPj4+PiBJIGhhdmUgc3R1bWJsZWQgb24gdGhlIHNpbWlsYXIgc3R1ZmYgYW5k
IHJlYWxpemUgdGhhdC4KPj4+Pgo+Pj4+IFBlcmhhcHMsIG9uZSBvZiB0aGUgc29sdXRpb24gaXMg
dG8gaGF2ZSBhbiBhZGRpdGlvbmFsIHN0cnVjdCB1bmRlcgo+Pj4+IHg4Nl9pbml0IHRvIGFsdGVy
bmF0ZSBBQ1BJIHJlbGF0ZWQgc3R1ZmYuCj4+Pgo+Pj4gSSB0aGluayB3ZSBjYW4gZ28gdGhhdCBy
b3V0ZSB3aGVuIGFub3RoZXIgdXNlciBvZiB0aGF0IGludGVyZmFjZSBpcwo+Pj4gYXBwZWFyaW5n
Lgo+Pgo+PiBXaHkgbm90IHRvIGVzdGFibGlzaCB0aGUgc3RydWN0PyBBdCBsZWFzdCB0aGlzIHJv
dXRlIEkgd291bGQgbGlrZSB0bwo+PiBnbyB3aXRoIFsxXS4KPj4KPj4gWzFdOiBodHRwczovL2xr
bWwub3JnL2xrbWwvMjAxOC8xLzE3LzgzNAo+Cj4gTWF5YmUgSSdtIGEgYml0IHNsb3cgdG9kYXks
IGJ1dCBjYXJlIHRvIGV4cGxhaW4gd2hhdCBleGFjdGx5IHlvdSBtZWFuPwoKSW5zdGVhZCBvZiBk
ZWNsYXJpbmcgZnVuY3Rpb24gYXMgX193ZWFrLCBlc3RhYmxpc2ggYSBuZXcgc3RydWN0IGZvcgpB
Q1BJIHJlbGF0ZWQgc3R1YnMgYW5kIGluY29ycG9yYXRlIGl0IGludG8geDg2X2luaXQuCgpUaGF0
IGlzIG15IHByb3Bvc2FsLiBJIHRoaW5rIEkgd291bGQgZ28gdGhpcyB3YXkgaW4gbXkgY2FzZSB3
aGVyZSBJCm5lZWQgdG8gdHJlYXQgZGlmZmVyZW50bHkgQUNQSSBIVyByZWR1Y2VkIGluaXRpYWxp
emF0aW9uIG9mIGxlZ2FjeQpkZXZpY2VzLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNo
ZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
