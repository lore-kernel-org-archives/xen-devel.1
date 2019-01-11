From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux 4.19.5 fails to boot as Xen dom0
Date: Fri, 11 Jan 2019 09:54:31 +0100
Message-ID: <701fca43-75cb-3dbb-8a34-7a1215f7e97d__42195.0425407433$1547196798$gmane$org@suse.com>
References: <a9a32e52-f50f-7d1a-ade0-baa2348ad78a@knorrie.org>
 <8faec76b-ab44-3148-165d-0f3c9f497de2@suse.com>
 <20181129132657.nlzxzqfdvngjsfvk@black.fi.intel.com>
 <bc770271-65a8-8bf4-10f9-6ce169e94130@suse.com>
 <20181206111352.GQ19891@kroah.com>
 <d0f3f0b2-d48b-4cd1-cf6e-e7a8176dd0da@suse.com>
 <20181206114609.GA19522@kroah.com>
 <26a64020-3974-ec4d-f64d-65669e87d505@suse.com>
 <a27939a1-261b-435f-1a0e-3732bdfe1ff3@suse.com>
 <20190111084603.GC13446@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bKv/=PT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ghsaK-0000Ia-L5
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 08:54:36 +0000
In-Reply-To: <20190111084603.GC13446@kroah.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg KH <greg@kroah.com>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, stable <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDEvMjAxOSAwOTo0NiwgR3JlZyBLSCB3cm90ZToKPiBPbiBGcmksIEphbiAxMSwgMjAx
OSBhdCAwODo1OTo1MkFNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAyMi8xMi8y
MDE4IDEyOjE0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMDYvMTIvMjAxOCAxMjo0Niwg
R3JlZyBLSCB3cm90ZToKPj4+PiBPbiBUaHUsIERlYyAwNiwgMjAxOCBhdCAxMjozMToxNVBNICsw
MTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+PiBPbiAwNi8xMi8yMDE4IDEyOjEzLCBHcmVn
IEtIIHdyb3RlOgo+Pj4+Pj4gT24gVGh1LCBOb3YgMjksIDIwMTggYXQgMDI6MzU6MTdQTSArMDEw
MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4+PiBPbiAyOS8xMS8yMDE4IDE0OjI2LCBLaXJp
bGwgQS4gU2h1dGVtb3Ygd3JvdGU6Cj4+Pj4+Pj4+IE9uIFRodSwgTm92IDI5LCAyMDE4IGF0IDA5
OjQxOjI1QU0gKzAwMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+PiBPbiAyOS8xMS8y
MDE4IDAyOjIyLCBIYW5zIHZhbiBLcmFuZW5idXJnIHdyb3RlOgo+Pj4+Pj4+Pj4+IEhpLAo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQXMgYWxzbyBzZWVuIGF0Ogo+Pj4+Pj4+Pj4+IGh0dHBzOi8vYnVn
cy5kZWJpYW4ub3JnL2NnaS1iaW4vYnVncmVwb3J0LmNnaT9idWc9OTE0OTUxCj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+PiBBdHRhY2hlZCB0aGVyZSBhcmUgdHdvIHNlcmlhbCBjb25zb2xlIG91dHB1dCBs
b2dzLiBPbmUgaXMgc3RhcnRpbmcgd2l0aAo+Pj4+Pj4+Pj4+IFhlbiA0LjExIChmcm9tIGRlYmlh
biB1bnN0YWJsZSkgYXMgZG9tMCwgYW5kIHRoZSBvdGhlciBvbmUgd2l0aG91dCBYZW4uCj4+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+PiBbICAgIDIuMDg1NTQzXSBCVUc6IHVuYWJsZSB0byBoYW5kbGUga2Vy
bmVsIHBhZ2luZyByZXF1ZXN0IGF0Cj4+Pj4+Pj4+Pj4gZmZmZjg4OGQ5ZmZmYzAwMAo+Pj4+Pj4+
Pj4+IFsgICAgMi4wODU2MTBdIFBHRCAyMDBjMDY3IFA0RCAyMDBjMDY3IFBVRCAwCj4+Pj4+Pj4+
Pj4gWyAgICAyLjA4NTY3NF0gT29wczogMDAwMCBbIzFdIFNNUCBOT1BUSQo+Pj4+Pj4+Pj4+IFsg
ICAgMi4wODU3MzZdIENQVTogMSBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkCj4+
Pj4+Pj4+Pj4gNC4xOS4wLXRydW5rLWFtZDY0ICMxIERlYmlhbiA0LjE5LjUtMX5leHAxK3B2aDEK
Pj4+Pj4+Pj4+PiBbICAgIDIuMDg1ODIzXSBIYXJkd2FyZSBuYW1lOiBIUCBQcm9MaWFudCBETDM2
MCBHNywgQklPUyBQNjggMDUvMjEvMjAxOAo+Pj4+Pj4+Pj4+IFsgICAgMi4wODU4OTVdIFJJUDog
ZTAzMDpwdGR1bXBfd2Fsa19wZ2RfbGV2ZWxfY29yZSsweDFmZC8weDQ5MAo+Pj4+Pj4+Pj4+IFsu
Li5dCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhlIG9mZmVuZGluZyBzdGFibGUgY29tbWl0IGlzIDQw
NzRjYTdkOGExODMyOTIxYzg2NWQyNTBiYmQwOGYzNDQxYjM2NTcKPj4+Pj4+Pj4+ICgieDg2L21t
OiBNb3ZlIExEVCByZW1hcCBvdXQgb2YgS0FTTFIgcmVnaW9uIG9uIDUtbGV2ZWwgcGFnaW5nIiks
IHRoaXMKPj4+Pj4+Pj4+IGlzIGNvbW1pdCBkNTI4ODhhYTI3NTNlMzA2M2E5ZDNhMGM5ZjcyZjk0
YWE5ODA5YzE1IHVwc3RyZWFtLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEN1cnJlbnQgdXBzdHJlYW0g
a2VybmVsIGlzIGJvb3RpbmcgZmluZSB1bmRlciBYZW4sIHNvIGluIGdlbmVyYWwgdGhlCj4+Pj4+
Pj4+PiBwYXRjaCBzaG91bGQgYmUgZmluZS4gVXNpbmcgYW4gdXBzdHJlYW0ga2VybmVsIGJ1aWx0
IGZyb20gYWJvdmUgY29tbWl0Cj4+Pj4+Pj4+PiAod2l0aCB0aGUgdGhlbiBuZWVkZWQgWGVuIGZp
eHVwIHBhdGNoIDE0NTdkOGNmNzY2NGYzNGM0YmE1MzQpIGlzIGZpbmUsCj4+Pj4+Pj4+PiB0b28u
Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gS2lyaWxsLCBhcmUgeW91IGF3YXJlIG9mIGFueSBwcmVyZXF1
aXNpdGUgcGF0Y2ggZnJvbSA0LjIwIHdoaWNoIGNvdWxkIGJlCj4+Pj4+Pj4+PiBtaXNzaW5nIGlu
IDQuMTkuNT8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSdtIG5vdC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gTGV0
IG1lIGxvb2sgaW50byB0aGlzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2hhdCBpcyBtYWtp
bmcgbWUgc3VzcGljaW91cyBpcyB0aGUgZmFpbHVyZSBoYXBwZW5pbmcganVzdCBhZnRlcgo+Pj4+
Pj4+IHJlbGVhc2luZyB0aGUgaW5pdCBtZW1vcnkuIE1heWJlIHRoZXJlIGlzIGFuIGFjY2VzcyB0
byAuaW5pdC5kYXRhCj4+Pj4+Pj4gc2VnbWVudCBvciBzaW1pbGFyPyBUaGUgbmF0aXZlIGtlcm5l
bCBib290aW5nIGNvdWxkIGJlIHJlbGF0ZWQgdG8gdGhlCj4+Pj4+Pj4gdXNhZ2Ugb2YgMk0gbWFw
cGluZ3Mgbm90IGJlaW5nIGF2YWlsYWJsZSBpbiBhIFBWLWRvbWFpbi4KPj4+Pj4+Cj4+Pj4+PiBE
aWQgdGhpcyBldmVyIGdldCBmaXhlZCBhbnl3aGVyZSB0aGF0IEkgY2FuIHByb3Blcmx5IGJhY2tw
b3J0IGl0IHRvIHRoZQo+Pj4+Pj4gNC4xOS55IHRyZWU/Cj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAxODExMzAyMDIzMjguNjUzNTktMi1raXJpbGwuc2h1dGVtb3ZA
bGludXguaW50ZWwuY29tLwo+Pj4+Pgo+Pj4+PiBTdGlsbCBwZW5kaW5nIHVwc3RyZWFtLiBKdXN0
IHBpbmdlZCB0Z2x4Lgo+Pj4+Cj4+Pj4gVGhhbmtzLCBpdCBzaG91bGQgaGF2ZSBnb3R0ZW4gYSBj
Yzogc3RhYmxlQCB0YWcsIGJ1dCBJIGNhbiB3YXRjaCBvdXQgZm9yCj4+Pj4gaXQuLi4KPj4+Cj4+
PiBJdCdzIHVwc3RyZWFtIG5vdzogY29tbWl0IDE2ODc3YTU1NzBlMGM1ZjQyNzBkNWIxN2Y5YmFi
NDI3YmNhZTk1MTQKPj4KPj4gQW55IHJlYXNvbiB5b3UgZGlkbid0IGluY2x1ZGUgdGhpcyBwYXRj
aCBpbiA0LjE5LjE0Pwo+IAo+IEkgd2FzIGNhdGNoaW5nIHVwIG9uIHBlbmRpbmcgcGF0Y2hlcyBh
bmQgZ290IHRvIHRoaXMgeWVzdGVyZGF5LiBJdAo+IHNob3VsZCBub3cgYmUgcXVldWVkIHVwIGFs
cmVhZHkgZm9yIHRoZSBuZXh0IHJlbGVhc2VzLCByaWdodD8KCk9rYXksIHRoYW5rcyBmb3IgY29u
ZmlybWF0aW9uLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
