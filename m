From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] docs/qemu-deprivilege: Revise and update
 with status and future plans
Date: Tue, 27 Mar 2018 16:52:51 +0100
Message-ID: <7f37ae93-4751-3c9e-3ca9-8def19a81cb5@citrix.com>
References: <20180322182437.936-1-george.dunlap@citrix.com>
 <23225.8997.574938.415857@mariner.uk.xensource.com>
 <87f60317-7913-a3ad-58eb-59928b8d7d61@citrix.com>
 <23226.18455.602635.161530@mariner.uk.xensource.com>
 <1a845c55-df25-1754-3e14-bdc47e658da8@citrix.com>
 <23226.22260.207702.968821@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------8F84DA6CF904E69C1CB93B28"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3kby=gr=citrix.com=prvs=6177cea8c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1f0qu9-0001kG-Mb
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 15:52:57 +0000
In-Reply-To: <23226.22260.207702.968821@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--------------8F84DA6CF904E69C1CB93B28
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 03/27/2018 03:36 PM, Ian Jackson wrote:
> George Dunlap writes ("Re: [PATCH] docs/qemu-deprivilege: Revise and update with status and future plans"):
>> On 03/27/2018 02:33 PM, Ian Jackson wrote:
>>> Anyway IMO we should set RLIMIT_NPROC after fork and before execve.
>>> If this causes setuid to fail in qemu, qemu will crash.  But this
>>> could only be the case if the new uid already has other processes,
>>> which it shouldn't do.  (If it does, the new uid is probably
>>> contaminated by a previous domain with the same domid.)
>>
>> I was more worried about the limit not having the expected effect after
>> the setuid().
> 
> I think we can safely rule that out.
> 
>>> I could find nothing in SuS explaining when process A may send signals
>>> to process B.  So I resorted to the BSD manpages:
>>>
>>>   https://www.unix.com/man-page/freebsd/2/kill/
>>>
>>>   For a process to have permission to send a signal to a process
>>>   designated by pid, the user must be the super-user, or the real or
>>>   saved user ID of the receiving process must match the real or
>>>   effective user ID of the sending process.
>>
>> The text of both the FreeBSD and Linux man pages looks to be copied
>> verbatim from [1].
>>
>> [1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/kill.html
> 
> I don't know how I missed that.  It's the 2nd paragraph!
> 
>>> `pet' could be a uid associated with a reserved domid, eg dom0.
>>
>> Right -- it looks like that could work.  I hadn't initially noticed the
>> {RUID, SUID} => {RUID, EUID} distinction.
>>
>> It's kind of hard to believe this is so difficult to pull off.
> 
> Yes!
> 
>> Should we post this to that forum, for the benefit of other people who
>> end up finding the same discussion? :-)
> 
> Tempting.  Let's wait until we see if it works, first ...

Seems to work for me.  See the attached proof-of-concept programs.

If in the "reaper" program you change 'xuid' to DEFAULT_TARGET_UID
instead, then it does indeed die in usleep; with a separate 'real'
userid it survives and "runner" dies.

 -George

--------------8F84DA6CF904E69C1CB93B28
Content-Type: text/x-chdr; name="common.h"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="common.h"

#ifndef COMMON_H

#define DEFAULT_TARGET_UID 32768
#define DEFAULT_REAPER_UID 32769

#endif /* COMMON_H */

--------------8F84DA6CF904E69C1CB93B28
Content-Type: text/x-csrc; name="reaper.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="reaper.c"

#define _GNU_SOURCE
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include <stdio.h>

#include "common.h"

int main(int argc, char * argv) {
    uid_t euid, tuid = DEFAULT_TARGET_UID, xuid = DEFAULT_REAPER_UID;
    int rc;

    /* Check to make sure we have enough permissions */
    euid = geteuid();

    if ( euid != 0 ) {
        fprintf(stderr, "Must run as euid 0 to set uid\n");
        return -1;
    }

    /* 
     * Set euid to TARGET_UID so that we can kill the 'runner'; but
     * set ruid to REAPER_UID so that the runner can't kill us.
     */
    if ( setresuid(xuid, tuid, 0) ) {
        perror("Setting uid to target");
        return -1;
    }

    printf("Sleeping for 1 second to get the runner a chance to kill me...\n");
    usleep(1000000);
    
    rc = kill(-1, 9);
    if ( rc )
        perror("No processes killed");
    else
        printf("At least one process killed successfully!\n");

    return 0;
}

--------------8F84DA6CF904E69C1CB93B28
Content-Type: text/x-csrc; name="runner.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="runner.c"

#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include <stdio.h>

#include "common.h"

int main(int argc, char * argv) {
    uid_t euid, tuid = DEFAULT_TARGET_UID;

    /* Check to make sure we have enough permissions */
    euid = geteuid();

    if ( euid != 0 ) {
        fprintf(stderr, "Must run as euid 0 to set uid\n");
        return -1;
    }

    if(setuid(tuid)) {
        perror("Setting uid to target");
        return -1;
    }

    while(1) {
        if(!fork())
            kill(-1, 9);
        else
            _exit(0);
    }
}

--------------8F84DA6CF904E69C1CB93B28
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------8F84DA6CF904E69C1CB93B28--
