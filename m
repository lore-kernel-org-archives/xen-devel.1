From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [RFC PATCH 3/6] vm_event: Refactor vm_event_domain
 implementation
Date: Wed, 19 Dec 2018 15:26:28 -0700
Message-ID: <CABfawhkm2szgyoJrcGu67M5Y7LEdLws4nVz2rLesAdwmo61ybw@mail.gmail.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <6ff6fbc82265cb59a39b6cef5cfd2cff0f861f9b.1545245243.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UzuZ=O4=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gZkJ3-0006s6-6a
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 22:27:09 +0000
Received: by mail-ed1-f65.google.com with SMTP id o10so16616edt.13
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 14:27:07 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id z39sm5721721edb.81.2018.12.19.14.27.05
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Dec 2018 14:27:06 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id v13so21099770wrw.5
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 14:27:05 -0800 (PST)
In-Reply-To: <6ff6fbc82265cb59a39b6cef5cfd2cff0f861f9b.1545245243.git.ppircalabu@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTksIDIwMTggYXQgMTE6NTIgQU0gUGV0cmUgUGlyY2FsYWJ1CjxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBEZWNvdXBsZSB0aGUgVk0gRXZlbnQgaW50
ZXJmYWNlIGZyb20gdGhlIHJpbmcgaW1wbGVtZW50YXRpb24uCgpUaGlzIHdpbGwgbmVlZCBhIG11
Y2ggYmV0dGVyIGRlc2NyaXB0aW9uLiBUaGVyZSBpcyBhbHNvIGEgbG90IG9mIGNodXJuCnRoYXQg
aXMgbW9zdGx5IGp1c3QgbWVjaGFuaWNhbCBpbiB0aGlzIHBhdGNoIGJ1dCBtYWtlcyByZXZpZXdp
bmcgaXQKaGFyZC4gUGVyaGFwcyBmdW5jdGlvbmFsIGNoYW5nZXMgYW5kIG1lY2hhbmljYWwgY2hh
bmdlcyBjb3VsZCBiZSBzcGxpdAp0byB0d28gcGF0Y2hlcz8KCj4gK3N0cnVjdCB2bV9ldmVudF9k
b21haW4KPiArewo+ICsgICAgLyogVk0gZXZlbnQgb3BzICovCj4gKyAgICBib29sICgqY2hlY2sp
KHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCk7Cj4gKyAgICBpbnQgKCpjbGFpbV9zbG90KShz
dHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQsIGJvb2wgYWxsb3dfc2xlZXApOwo+ICsgICAgdm9p
ZCAoKnJlbGVhc2Vfc2xvdCkoc3RydWN0IHZtX2V2ZW50X2RvbWFpbiAqdmVkKTsKPiArICAgIHZv
aWQgKCpwdXRfcmVxdWVzdCkoc3RydWN0IHZtX2V2ZW50X2RvbWFpbiAqdmVkLCB2bV9ldmVudF9y
ZXF1ZXN0X3QgKnJlcSk7Cj4gKyAgICBpbnQgKCpnZXRfcmVzcG9uc2UpKHN0cnVjdCB2bV9ldmVu
dF9kb21haW4gKnZlZCwgdm1fZXZlbnRfcmVzcG9uc2VfdCAqcnNwKTsKPiArICAgIGludCAoKmRp
c2FibGUpKHN0cnVjdCB2bV9ldmVudF9kb21haW4gKipfdmVkKTsKCkkgZG9uJ3Qgc2VlICh5ZXQp
IHRoZSByZWFzb24gd2h5IGhhdmluZyB0aGVzZSBwb2ludGVycyBzdG9yZWQgaW4gdGhlCnN0cnVj
dCBpcyBuZWVkZWQuIEFyZSB0aGVyZSBnb2luZyB0byBiZSBkaWZmZXJlbnQgaW1wbGVtZW50YXRp
b25zIGZvcgp0aGVzZT8gSWYgc28sIG5lZWQgdG8gZXhwbGFpbiB0aGF0IGluIHRoZSBjb21taXQg
bWVzc2FnZS4KCj4gKwo+ICsgICAgLyogVGhlIGRvbWFpbiBhc3NvY2lhdGVkIHdpdGggdGhlIFZN
IGV2ZW50ICovCj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkOwo+ICsKPiArICAgIC8qIHJpbmcgbG9j
ayAqLwo+ICsgICAgc3BpbmxvY2tfdCBsb2NrOwo+ICt9Owo+ICsKPiArYm9vbCB2bV9ldmVudF9j
aGVjayhzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICp2ZWQpCj4gK3sKPiArICAgIHJldHVybiAodmVk
ICYmIHZlZC0+Y2hlY2sodmVkKSk7Cj4gK30KPgo+IC0gICAgcmV0dXJuIHJjOwo+ICsvKiBWTSBl
dmVudCBkb21haW4gcmluZyBpbXBsZW1lbnRhdGlvbiAqLwo+ICtzdHJ1Y3Qgdm1fZXZlbnRfZG9t
YWluX3JpbmcKPiArewo+ICsgICAgLyogVk0gZXZlbnQgZG9tYWluICovCj4gKyAgICBzdHJ1Y3Qg
dm1fZXZlbnRfZG9tYWluIHZlZDsKCldoeSBpcyB0aGlzIG5vdCBhIHBvaW50ZXIgaW5zdGVhZD8g
RG9lcyBlYWNoIHZtX2V2ZW50X2RvbWFpbl9yaW5nCnJlYWxseSBuZWVkIGEgc2VwYXJhdGUgY29w
eSBvZiB2bV9ldmVudF9kb21haW4/Cgo+ICsgICAgLyogVGhlIHJpbmcgaGFzIDY0IGVudHJpZXMg
Ki8KPiArICAgIHVuc2lnbmVkIGNoYXIgZm9yZWlnbl9wcm9kdWNlcnM7Cj4gKyAgICB1bnNpZ25l
ZCBjaGFyIHRhcmdldF9wcm9kdWNlcnM7Cj4gKyAgICAvKiBzaGFyZWQgcmluZyBwYWdlICovCj4g
KyAgICB2b2lkICpyaW5nX3BhZ2U7Cj4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICpyaW5nX3BnX3N0
cnVjdDsKPiArICAgIC8qIGZyb250LWVuZCByaW5nICovCj4gKyAgICB2bV9ldmVudF9mcm9udF9y
aW5nX3QgZnJvbnRfcmluZzsKPiArICAgIC8qIGV2ZW50IGNoYW5uZWwgcG9ydCAodmNwdTAgb25s
eSkgKi8KPiArICAgIGludCB4ZW5fcG9ydDsKPiArICAgIC8qIHZtX2V2ZW50IGJpdCBmb3IgdmNw
dS0+cGF1c2VfZmxhZ3MgKi8KPiArICAgIGludCBwYXVzZV9mbGFnOwo+ICsgICAgLyogbGlzdCBv
ZiB2Y3B1cyB3YWl0aW5nIGZvciByb29tIGluIHRoZSByaW5nICovCj4gKyAgICBzdHJ1Y3Qgd2Fp
dHF1ZXVlX2hlYWQgd3E7Cj4gKyAgICAvKiB0aGUgbnVtYmVyIG9mIHZDUFVzIGJsb2NrZWQgKi8K
PiArICAgIHVuc2lnbmVkIGludCBibG9ja2VkOwo+ICsgICAgLyogVGhlIGxhc3QgdmNwdSB3b2tl
biB1cCAqLwo+ICsgICAgdW5zaWduZWQgaW50IGxhc3RfdmNwdV93YWtlX3VwOwo+ICt9Owo+ICsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
